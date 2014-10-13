class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    return render :login unless current_user

    @accounts = current_user.restforce.query("SELECT Id, Name From Account")
    @names = @accounts.collect(&:Name).sort
  end
end
