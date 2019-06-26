module Api::V1
  class ApplicationController < ActionController::Base
    
    def set_ranges
      return if params[:str].nil?
      render json: {result: params[:str].gsub(/(bc|87)/, '-')}
    end

    def set_5_letters
      return if params[:str].nil?
      result = ApiService.new(str: params[:str].strip).set_5_letters.join("\n")
      render json: {result: ApiService.new(str: params[:str].strip).set_5_letters}
    end
  end
end
