class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!
end
