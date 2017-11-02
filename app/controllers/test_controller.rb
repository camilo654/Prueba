class TestController < ApplicationController
  def create
    #@users = User.all

    msg = {:userValid => true}
    render :json => msg
  end
end
