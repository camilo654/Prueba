class Test2Controller < ApplicationController
   def index
     msg = {:x => rand(10)}
     render :json => msg
   end
end
