class ApplicationController < ActionController::Base
  helper_method :resource_name, :resource_name2, :resource, :devise_mapping
  def resource_name
    :user
  end

  def resource_name2
    :owner
  end

  def resource
    @resource ||= User.new ||= Owner.new
  end

  def resource_class
    User || Owner
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user] ||= Devise.mappings[:owner]
  end
end
