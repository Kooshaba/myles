class Order < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :item
end
