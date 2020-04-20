class CommuteAnalyzerController < ApplicationController
  def index
    @commute_times = CommuteTime.all
  end
end