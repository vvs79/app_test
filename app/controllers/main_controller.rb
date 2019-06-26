class MainController < ApplicationController

  def index
  end

  def create_yml
    file_path = ApiService.new(file: params[:file]).create_yml
    send_file file_path, filename: "translations.yml"
  rescue
    redirect_to :back
  end

end
