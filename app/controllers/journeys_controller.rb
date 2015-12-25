class JourneysController < ApplicationController
 def index
  @journeys = Journey.all.order("created_at desc")
 end

 def show
  @journey = Journey.find(params[:id])
  @episodes = Episode.where(journey_id: @journey).order("created_at desc")
 end

end
