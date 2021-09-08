FactoryBot.define do
  factory :user do
    email { "ceo@example.com" }
    password { "password1" }
    id { 3 }
    authentication_token { "1G8_s7P-V-4MGojaKD7a" }
  end
end
