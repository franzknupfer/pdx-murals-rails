class MapController < ApplicationController
  def index
    @murals = Mural.all
    @hash = Gmaps4rails.build_markers(@murals) do |mural, marker|
      marker.lat mural.latitude
      marker.lng mural.longitude
      marker.picture({
        url: "#{view_context.image_path("map_marker.png") }",
                    width: "64",
                    height: "64"
      })
      marker.infowindow %Q(<div id="infobox">
      <a href="/murals/#{mural.id}">
      <img src="#{mural.attached_image.url(:medium)}"><p><strong>Name:</strong> #{mural.mural_name} </p><p><strong>Year:</strong> #{ mural.year_created } </p><p><strong>Address:</strong> #{ mural.mural_address }<p><strong>Created by:</strong> #{mural.artist_name}</p></a></div>)
    end
  end

  def show
    @mural = Mural.find(params[:id])
  end
end
