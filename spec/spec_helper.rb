require "rubygems"
require "active_merchant"

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "active_merchant_mollie"

ActiveMerchant::Billing::Base.mode = :test

