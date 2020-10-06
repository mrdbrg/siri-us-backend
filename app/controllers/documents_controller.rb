class DocumentsController < ApplicationController
  def index
    documents = Document.all.order('created_at ASC')
    
    render json: documents
  end
  
  def create
    img_file = Cloudinary::Uploader.upload(params[:file], "format" => 'jpg')

    document = Document.create(name: params[:fileName], url: img_file["url"], project_id: params[:projectId], user_id: params[:userId])
    render json: document
  end
end
