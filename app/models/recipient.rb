class Recipient < ActiveRecord::Base
  has_one :address
  belongs_to :user

  accepts_nested_attributes_for :address
end
