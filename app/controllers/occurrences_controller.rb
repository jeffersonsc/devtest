class OccurrencesController < ApplicationController
  before_action :set_occurence, only: [:show]
  before_action :authenticate_user!

  def index
  	@occurrences = Occurrence.group(:twitter_user_id, :id).sort_by {|o| o.twitter_user.followers}.reverse.paginate(:page => params[:page], :per_page => 30)
  end

  def show
  end

  def set_occurence
  	@occurrence = Occurrence.find(params[:id])
  end
end
