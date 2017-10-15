class TestController < ApplicationController
  def index
    #@users = User.all
    msg = {:x => rand(10)}
    render :json => msg

  end
end
