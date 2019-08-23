class HomesController < ApplicationController
  def index
    @survey = Survey.new
  end
end