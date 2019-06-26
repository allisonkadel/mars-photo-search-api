class Api::PhotosController < ApplicationController

  MARS_API_URL = 'https://mars-photos.herokuapp.com/api/v1/rovers/curiosity/photos'

  def search
    if !params['sol'].blank? && !params['camera'].blank?
      resp = Faraday.get MARS_API_URL do |req|
        req.params['sol'] = params['sol']
        req.params['camera'] = params['camera']
      end
      body = JSON.parse(resp.body)
      render :json => body['photos']
    else
      errors = {
        :messages => []
      }
      if params['sol'].blank?
        errors[:messages] << "sol can't be blank"
      end
      if params['camera'].blank?
        errors[:messages] << "camera can't be blank"
      end
      render :json => errors, :status => 400
    end
  end

end

# Things left to do:

# Clear form after Submit
