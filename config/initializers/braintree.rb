Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
# Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID']
# Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY']
# Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']

Braintree::Configuration.merchant_id = "smfgsnxmxxvsjh6p"
Braintree::Configuration.public_key = "kq4qfwtk8d6zqshw"
Braintree::Configuration.private_key = "2cd173ddf3443fd3305c95d6f994c489"