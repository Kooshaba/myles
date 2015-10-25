FactoryGirl.define do
  factory :user do
    password 'andyandy123'
    sequence :email do |i|
      "elrond#{i}@rivendell.io"
    end

    sequence :first_name do |i|
      "Hafu V#{i}"
    end
    last_name "Summit"
  end
end
