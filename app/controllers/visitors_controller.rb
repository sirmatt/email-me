class VisitorsController < ApplicationController
  def new
    @owner = Owner.new
    flash.now[:notice] = 'Welcome!'
    flash.now[:alert] = "#{@owner.name}'s birthday is soon; like in #{@owner.countdown} days!"
  end
end
