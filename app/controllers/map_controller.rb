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
      marker.infowindow render_to_string(:partial => "/map/map_infobox", :locals => { :mural => mural})
    end
  end

  def show
    @murals = Mural.all
    @hash = Gmaps4rails.build_markers(@murals) do |mural, marker|
      marker.lat mural.latitude
      marker.lng mural.longitude
      marker.picture({
        url: "#{view_context.image_path("map_marker.png") }",
                    width: "64",
                    height: "64"
      })
      marker.infowindow render_to_string(:partial => "/map/map_infobox", :locals => { :mural => mural})
    end
  end
end
