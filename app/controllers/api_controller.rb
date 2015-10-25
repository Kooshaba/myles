class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def categories
    render json: { categories: Category.all }
  end

  def category
    category = Category.find(params.require(:category_id))
    render json: { items: category.items }, root: true
  end

  def place_order
    item      = Item.find(params.require(:item_id))

    order = Order.new(recipient: recipient, item: item)
    if order.save
      render json: order, root: true
    else
      render status: 500
    end
  end

  def orders
    if recipient
      render json: { orders: recipient.orders }, root: true
    else
      render status: 500
    end
  end

  def last_recipient
    render json: Recipient.last, root: true
  end

  private

  def recipient
    @recipient = Recipient.find(params.require(:recipient_id))
  end
end
