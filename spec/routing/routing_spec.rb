require 'spec_helper'

describe 'routing' do

  it 'routes / to RootController#index' do
    get( '/' ).should route_to( 'root#index' )
  end

end