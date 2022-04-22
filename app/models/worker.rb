class Worker < ApplicationRecord
  # resourcify
  rolify
  has_secure_password
end
