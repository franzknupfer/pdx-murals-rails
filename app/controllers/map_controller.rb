class MapController < ApplicationController
  def index
    @murals = Mural.all
    @hash = Gmaps4rails.build_markers(@murals) do |mural, marker|
      marker.lat mural.latitude
      marker.lng mural.longitude
      marker.infowindow %Q(<div id="infobox">
      <a href="/murals/#{mural.id}">
      <img src="#{mural.attached_image.url(:medium)}"><h1>#{mural.mural_name}</h1><h3>#{mural.artist_name}</h3></a></div>)
    end
  end

  def show
    @mural = Mural.find(params[:id])
  end
end
