class Order < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :item
  belongs_to :shipment

  def as_json options={}
    hash = self.attributes

    hash[:item] = item.attributes
    hash
  end
end
