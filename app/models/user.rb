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
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validate :check_birthdate

  # Callbacks
  before_commit :user_status

  def check_birthdate
    self.birthdate > Date.today ?  errors.add(:birthdate, "cannot be greater than today's date") : nil
  end

  # add status showing if the user is standard tier customer, gold tier customer or
  # platinum tier customer depending upon the points.
  # add reward thing.
  def user_status
    self.customer_tier = "standard" if self.points <= 999
    self.customer_tier = "gold" if self.points > 1000 && self.points < 4999
    self.customer_tier = "plaitnum" if self.points > 5000
    self.save!
  end
end
