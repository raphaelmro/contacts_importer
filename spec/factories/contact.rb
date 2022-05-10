FactoryBot.define do
  factory :contact do
    name { "Diglett" }
    birth_date { "2001-05-09" }
    phone { "(+57) 320-432-05-09" }
    address { "Pallet" }
    credit_card { "371449635398431" }
    email { "diglett@pokemon.com" }
    user
  end
end
