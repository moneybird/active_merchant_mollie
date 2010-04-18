require "hpricot"

module ActiveMerchant
  module Billing
    class MollieIdealGateway < Gateway
      
      URL = "https://secure.mollie.nl/xml/ideal"
      
      def initialize(options={})
        requires!(options, :partner_id)
        
        @options = options
      end
      
      def setup_purchase(money, options)
        requires!(options, :return_url, :report_url, :bank_id, :description)
        
        raise ArgumentError.new("Amount should be at least 1,80EUR") if money < 180
        
        @response = build_response_fetch(commit("fetch", {
          :amount         => money,
          :bank_id        => options[:bank_id],
          :description    => CGI::escape(options[:description] || ""),
          :partnerid      => @options[:partner_id],
          :reporturl      => options[:report_url],
          :returnurl      => options[:return_url]
        }))
      end
      
      def redirect_url_for(token)
        @response.url if @response.token == token
      end
      
      def details_for(token)
        build_response_check(commit('check', {
          :partnerid        => @options[:partner_id],
          :transaction_id   => token,
          :testmode         => ActiveMerchant::Billing::Base.test?
        }))
      end
      
      private
      
      def commit(action, parameters)
        url   = URL + "?a=#{action}&#{parameters.collect { |k,v| "#{k}=#{v}" }.join("&") }"
        uri   = URI.parse(url)
        http  = Net::HTTP.new(uri.host, uri.port)
        http.get(uri.request_uri).body
      end
      
      def build_response_fetch(response)
        vars = {}
        doc = Hpricot.XML(response)
        success = false
        if doc.search("response/item").size > 0
          errorcode = doc.at('response/item/errorcode').inner_text
          message = doc.at('response/item/message').inner_text + " (#{errorcode})"
        elsif doc.search("response/order").size > 0
          vars = {}
          resp = doc.at('response/order')
          if resp && resp.at('amount') && resp.at('transaction_id') && resp.at('URL')
            vars[:amount] = resp.at('amount').inner_text
            vars[:transaction_id] = resp.at('transaction_id').inner_text
            vars[:url] = resp.at('URL').inner_text
          end
          success = true
        end
        MollieIdealFetchResponse.new(success, message, vars)
      end
      
      def build_response_check(response)
        doc = Hpricot.XML(response)
        success = false
        if doc.search("response/item").size > 0
          errorcode = doc.at('response/item/errorcode').inner_text
          message = doc.at('response/item/message').inner_text + " (#{errorcode})"      
        elsif doc.search("response/order").size > 0
          resp = doc.at('response/order')
          success = resp && resp.at('payed') && resp.at('payed').inner_text.downcase == "true"
        end
        MollieIdealCheckResponse.new(success, message)
      end
      
    end
  end
end