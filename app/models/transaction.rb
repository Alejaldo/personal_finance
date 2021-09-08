class Transaction < ApplicationRecord
  belongs_to :user

  acts_as_token_authenticatable
end
