class Biblio::V1 < Grape::API
  format :json
  default_format :json
  prefix :api
  version 'v1', using: :path

  resource :books do
    desc "Returns the books in a library"
    params do
      requires :libid, type: Integer, desc: "The library id"
    end
    get :mine do
      Library.find(params[:libid]).books
    end
  end

  get :ping do
    "pong"
  end
end
