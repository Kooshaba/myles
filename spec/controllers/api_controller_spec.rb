require 'rails_helper'

describe ApiController do
  before do
    2.times do |i|
      Category.create name: "Category#{i}", image_url: "images/category_#{i}"
    end

    3.times do |i|
      Category.first.items << (Item.create name: "Spoon#{i}", image_url: "images/item_#{i}")
    end

    Category.last.items << Item.create(name: "Fork", image_url: "images/item")
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
      expect(JSON.parse(response.body).count).to eq 3
    end
  end

  describe "#place_order" do
    let(:recipient) { create :recipient }

    subject { post :place_order, { recipient_id: recipient.id, item_id: Item.first.id } }

    it "works" do
      expect { subject }.to change { recipient.orders.count }.by(1)
    end
  end
end
