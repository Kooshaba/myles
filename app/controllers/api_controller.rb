class ApiController < ApplicationController
  def categories
    render json: Category.all
  end

  def category
    category = Category.find(params.require(:category_id))
    render json: category.items
  end

  def place_order
    recipient = Recipient.find(params.require(:recipient_id))
    item      = Item.find(params.require(:item_id))

    order = Order.new(recipient: recipient, item: item)
    if order.save
      render json: order
    else
      render status: 500
    end
  end
end
