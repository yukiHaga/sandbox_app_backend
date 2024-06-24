class ApplicationController < ActionController::API
  include ActionController::Cookies

  # record_not_foundにはerrorインスタンスが渡される
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def response_not_found(message, type: nil)
    res = { message: }
    res.merge({ type: }) if type.present?
    render json: res, status: :not_found
  end

  private

  def record_not_found(e)
    response_not_found(e.message)
  end
end
