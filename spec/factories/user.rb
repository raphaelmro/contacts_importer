FactoryBot.define do
  factory :user do
    email { 'test@pokemon.com' }
    password { "123456" }
    password_confirmation { "123456" }
  end
end