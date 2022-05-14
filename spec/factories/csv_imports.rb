FactoryBot.define do
  factory :csv_import do
    filename { "mycontacts.csv" }
    status { :on_hold }
    user { User.last }
  end
end
