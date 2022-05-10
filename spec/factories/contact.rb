FactoryBot.define do
  factory :contact do
    name { "Diglett" }
    birth_date { "2001-05-09" }
    phone { "(+57) 320-432-05-09" }
    address { "Pallet" }
    credit_card { "4111111111111111" }
    email { "diglett@pokemon.com" }
    user
  end
end
