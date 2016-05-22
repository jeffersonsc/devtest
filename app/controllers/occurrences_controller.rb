class OccurrencesController < ApplicationController
  before_action :set_occurence, only: [:show]

  def index
  	@occurrences = Occurrence.all.sort_by{|o| o.twitter_user.followers}.reverse.paginate(:page => params[:page], :per_page => 30)
  end

  def show
  end

  def set_occurence
  	@occurrence = Occurrence.find(params[:id])
  end
end
