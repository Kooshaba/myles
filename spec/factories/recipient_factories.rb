FactoryGirl.define do
  factory :recipient do
    sequence :first_name do |i|
      "Hafu V#{i}"
    end

    last_name "Summit"

    user
  end
end
