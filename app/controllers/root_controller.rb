class RootController < ApplicationController

  def index
    MeterCat.add( :root_index )
  end

end