class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :require_status, only: [:update]

  @@status = 'No'

  def show
    respond_to do |format|
      format.html
      format.json {
        render json: { status: @@status }
      }
    end
  end

  def update
    case params[:status].to_sym
    when :here
      @@status = 'Yes'
    when :gone
      @@status = 'No'
    end

    respond_to do |format|
      format.html{ redirect_to root_path }
      format.json{ render json: { result: 'OK' } }
    end
  end

  protected

  def require_status
    return unless params[:status].blank?
    redirect_to root_path
  end

  def current_status
    @@status
  end
  helper_method :current_status
end
