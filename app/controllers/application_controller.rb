class ApplicationController < ActionController::Base
  protected

  def set_title(str)
    @title = (str.nil? or str.blank?) ? 'IMDB' : str + ' - IMDB'
  end
end
