module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class MollieIdealCheckResponse < Response
      
      def consumer_account
        @params['consumer_account']
      end
      
      def consumer_city
        @params['consumer_city']
      end
      
      def consumer_name
        @params['consumer_name']
      end
      
    end
  end
end
