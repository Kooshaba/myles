class ApiController < ApplicationController
  def categories
    render json: Category.all
  end

  def category
    category = Category.find(params.require(:category_id))
    render json: category.items
  end

  def place_order
    item      = Item.find(params.require(:item_id))

    order = Order.new(recipient: recipient, item: item)
    if order.save
      render json: order
    else
      render status: 500
    end
  end

  def orders
    if recipient
      render json: recipient.orders
    else
      render status: 500
    end
  end

  private

  def recipient
    @recipient = Recipient.find(params.require(:recipient_id))
  end
end
