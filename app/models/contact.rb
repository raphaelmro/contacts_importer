class Contact < ApplicationRecord
  belongs_to :user
  before_validation :set_cc_franchise_name, :set_cc_last_four_digits
  after_validation :encrypt_cc_number, on: :create

  REGEX_NAME = /\A[^0-9`!@#\$%\^&*+_=]+\z/.freeze
  REGEX_MAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates_format_of :name, with: REGEX_NAME,
                      message: "only allows letters and coumpound names with '-'"
  validates_format_of :email, with: REGEX_MAIL,
                      message: "only allows valid emails"

  validates :name, :email, :birth_date, :address, :phone,
            :credit_card, :franchise, :cc_last_digits, presence: true

  validates :name, length: { minimum: 2 }


  private
  def set_cc_franchise_name
    franchise_name = CreditCardValidations::Detector.new(self.credit_card).brand_name
    self.franchise = franchise_name
  end

  def set_cc_last_four_digits
    self.cc_last_digits = self.credit_card[-4..-1]
  end

  def encrypt_cc_number
    self.credit_card = BCrypt::Password.create(self.credit_card)
  end


end
