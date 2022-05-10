class Contact < ApplicationRecord
  belongs_to :user

  REGEX_NAME = /\A[^0-9`!@#\$%\^&*+_=]+\z/.freeze
  REGEX_MAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates_format_of :name, with: REGEX_NAME,
                      message: "only allows letters and coumpound names with '-'"
  validates_format_of :email, with: REGEX_MAIL,
                      message: "only allows valid emails"

  validates :name, :email, :birth_date, :address, :phone,
            :credit_card, :franchise, presence: true


  def card_franchise
    card_franchise_name = CreditCardValidations::Detector.new(self.credit_card).brand_name
    self.franchise = card_franchise_name
  end

  def my_card
    self.credit_card = credit_card
  end

end
