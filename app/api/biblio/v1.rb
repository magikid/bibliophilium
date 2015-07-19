class Biblio::V1 < Grape::API
  format :json
  default_format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers
  prefix :api
  version 'v1', using: :path

  helpers do
    def current_library
      @current_library = Library.find(2)
    end
  end

  resource :books do
    desc "Returns the books in a library"
    get do
      current_library.books 
    end
    
    desc "Returns a single book"
    params do
      requires :id, type: Integer, desc: "A book ID"
    end
    get ':id' do
      Book.find(params[:id])
    end

    desc "Create a new book"
    params do
      requires :title, type: String, desc: "The books title"
      requires :author, type: String, desc: "The books author"
      requires :isbn, type: String, desc: "The book's ISBN"
    end
    post do
      Book.create!({
        tite: params[:title],
        author: params[:author],
        isbn: params[:isbn]
      })
    end

    desc "Update a book"
    params do
      requires :id, type: Integer, desc: "The book's ID to update"
      requires :title, type: String, desc: "The books title"
      requires :author, type: String, desc: "The books author"
      requires :isbn, type: String, desc: "The book's ISBN"
    end
    put do
      Book.find(params[:id]).update({
        title: params[:title],
        author: params[:author],
        isbn: params[:isbn]
      })
    end

    desc "Delete a book"
    params do
      requires :id, type: Integer, desc: "The book's ID to delete"
    end
    delete ':id' do
      Book.find(params[:id]).destroy
    end
  end

  get :ping do
    "pong"
  end
end
