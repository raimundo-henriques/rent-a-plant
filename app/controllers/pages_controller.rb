class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @plants = policy_scope(Plant)

    @markers = @plants.map do |plant|
      address = plant.address.parameterize.gsub(' ', '%20').gsub(',', '%2C')
      geocoder_url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{address}.json?proximity=ip&types=place%2Cpostcode%2Caddress&access_token=#{ENV['MAPBOX_API_KEY']}"
      geocoder_serialized = URI.open(geocoder_url).read
      geocoder_json = JSON.parse(geocoder_serialized)
      {
        lat: geocoder_json["features"][0]["geometry"]["coordinates"][1],
        lng: geocoder_json["features"][0]["geometry"]["coordinates"][0],
        info_window: render_to_string(partial: "plants/info_window", locals: {plant: plant}),
        image_url: helpers.asset_url("pagelines-brands.png")
      }
    end
  end
end
