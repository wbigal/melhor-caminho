class TraceRoutesController < ApplicationController
  def index
  end

  def create
    way = TraceRoutesService.to_default_destination 'none', lat, lng
    @way = TraceRoutes::WayDecorator.for(way)
    render json: @way
  end

  private
    def lat
      params[:lat]
    end

    def lng
      params[:lng]
    end
end
