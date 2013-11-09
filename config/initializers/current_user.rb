if Rails.env.test? || Rails.env.development?
  CURRENT_USER_ADDRESS = '405 Howard Street, San Francisco, CA, 94105'
else
  CURRENT_USER_ADDRESS = request.location.address
end