class Api::V1::BaseController < ActionController::Base
	skip_before_action :verify_authenticity_token
	layout false

	def json_response(data, option = nil)
    if option.present?
      return render json: { success: true, data: data, meta_key: option, errors: []}, status: 200
    end
    render json: { success: true, data: data, errors: []}, status: 200
  end

end