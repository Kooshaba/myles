class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :recipient
  accepts_nested_attributes_for :recipient

  has_one :billing_detail

  def full_name
    "#{first_name} #{last_name}"
  end
end
