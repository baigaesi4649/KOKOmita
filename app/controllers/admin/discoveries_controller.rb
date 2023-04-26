class Admin::DiscoveriesController < ApplicationController

  def index
    @discoveries = Discovery.all
  end
  
end
