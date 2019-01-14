class ApplicationController < ActionController::Base
  include Clearance::Controller

  def allowed?(action:, user:)
    # implement some code
  end

  def not_allowed?
  	current_user == nil or !(current_user.superadmin? or @listing.user == current_user)
  end

end
