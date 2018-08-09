class HomeController < ApplicationController
  def index
    @crypto = Cryptocurrency.all
  end

  def show
    @crypto = Cryptocurrency.find_by(name: params[:name]).value
  end

end
