class Api::V1::TransactionsController < Api::V1::BaseController

  # POST /api/v1/create
  def create
    transaction = Transaction.create(transaction_params)
    json_response(TransactionsSerializer.new(transaction).serializable_hash[:data][:attributes])
  end

  private
  def transaction_params
    params.require(:transactions).permit(:quantity, :product_id, :currency_id, :user_id)
  end
end
