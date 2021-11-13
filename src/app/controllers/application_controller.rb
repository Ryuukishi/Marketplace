class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:page, :index, :show]
end
