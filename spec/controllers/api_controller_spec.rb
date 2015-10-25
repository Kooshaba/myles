require 'rails_helper'

describe ApiController do
  let(:recipient) { create :recipient }

  before do
    2.times do |i|
      Category.create name: "Category#{i}", image_url: "images/category_#{i}"
    end

    3.times do |i|
      Category.first.items << (Item.create name: "Spoon#{i}", image_url: "images/item_#{i}")
    end

    Category.last.items << Item.create(name: "Fork", image_url: "images/item")

    recipient.orders << Order.create(item: Item.first)
  end

  describe "#categories" do
    subject { get :categories }

    it "works" do
      subject
      expect(JSON.parse(response.body).count).to eq 2
    end
  end

  describe "#category" do
    subject { get :category, { category_id: Category.first.id } }

    it "works" do
      subject
      ap response.body
      expect(JSON.parse(response.body).count).to eq 3
    end
  end

  describe "#place_order" do
    subject { post :place_order, { recipient_id: recipient.id, item_id: Item.first.id } }

    it "works" do
      expect { subject }.to change { recipient.orders.count }.by(1)
    end
  end

  describe "#orders" do
    subject { get :orders, { recipient_id: recipient.id } }

    it "works" do
      subject
      expect(JSON.parse(response.body)).to_not eq nil
    end
  end
end
