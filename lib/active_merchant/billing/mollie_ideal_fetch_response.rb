module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class MollieIdealFetchResponse < Response
    
      def token
        @params['transaction_id']
      end
      
      def url
        @params['url']
      end
      
      def amount
        @params['amount']
      end
      
    end
  end
end