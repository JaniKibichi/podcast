class JourneysController < ApplicationController
 before_action :find_journey, only: [:show, :dashboard]
 before_action :find_episode, only: [:show, :dashboard]

 def index
  @journeys = Journey.all.order("created_at desc")
 end

 def show
 end

 def dashboard 
 end

 private
 def find_episode
  @episodes = Episode.where(journey_id: @journey).order("created_at desc")  
 end

 def find_journey
  if params[:id].nil?
    @journey = current_journey
  else
    @journey = Journey.find(params[:id])
  end
 end
end
