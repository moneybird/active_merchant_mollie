module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class MollieIdealCheckResponse < Response
      
      def consumerAccount
        @params['consumerAccount']
      end
      
      def consumerCity
        @params['consumerCity']
      end
      
      def consumerName
        @params['consumerName']
      end
      
    end
  end
end
