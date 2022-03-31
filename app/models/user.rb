class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum customer_tier: %i[standard gold platinum]

  # Associations
  has_many :transactions
  has_many :products, through: :transactions
  belongs_to :currency

  # Validations
  validates :first_name, :last_name, :birthdate, presence: true
  validate :check_birthdate

  def check_birthdate
    self.birthdate > Date.today ?  errors.add(:birthdate, "cannot be greater than today's date") : nil
  end

  # returns the associated transactions that are created with same currency.
  def fetch_native_transactions
    transactions.where(currency_id: currency_id)
  end
end
