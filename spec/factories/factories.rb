FactoryGirl.define do
  factory :user
  
  factory :session do
    token { SecureRandom.uuid }
  end
  
  factory :joke

  factory :tag
end

