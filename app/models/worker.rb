class Worker < ApplicationRecord
  rolify
  resourcify
  has_secure_password
end
