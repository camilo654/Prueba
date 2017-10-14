class TestController < ApplicationController
  def index
    #@users = User.all
    msg = {:y => "sdasda", :courseId => "courseId"}
    render :json => msg

  end
end
