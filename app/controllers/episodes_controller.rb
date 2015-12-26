class EpisodesController < ApplicationController
 before_action :find_journey
 before_action :find_episode, only: [:show, :edit, :update, :destroy]

 def new
  @episode =@journey.episodes.new
 end

 def create
  @episode = @journey.episodes.new episode_params
  if episode.save
   redirect_to journey_episode_path(@journey, @episode)
  else
   render 'new'
  end
 end 

 def show
  @episode = Episode.where(journey_id: @journey.order("created_at desc").reject { |e| e.id ==@episode.id}  
 end

 def edit
 end

 def update
  if @episode.update episode_params
   redirect_to journey_episode_path(@journey, @episode), notice:"Episode was successfully updated!"
  else
   render 'edit'  
  end
 end

 def destroy
  @episode.destroy
  redirect_to root_path
 end

 private
 def episode_params
  params.require(:episode).permit(:title, :description)
 end

 def find_journey
  @journey = Journey.find(params[:journey_id])
 end

 def find_episode
  @episode = Episode.find(params[:id])
 end

end
