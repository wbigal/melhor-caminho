class TraceRoutesController < ApplicationController
  def index
  end

  def create
    way = TraceRoutesService.to_default_destination client_id, lat, lng

    if way.blank?
      render json: nil
    else
      render json: TraceRoutes::WayDecorator.for(way)
    end
  end

  private
    def lat
      params[:lat]
    end

    def lng
      params[:lng]
    end

    def client_id
      if cookies[:client_id].blank?
        cookies.permanent[:client_id] = SecureRandom.uuid
      end
      cookies[:client_id]
    end
end
