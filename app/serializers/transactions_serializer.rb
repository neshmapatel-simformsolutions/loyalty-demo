class TransactionsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :amount, :value, :quantity

  attribute :username do |object|
    object.user.first_name + " " + object.user.last_name
  end
end
