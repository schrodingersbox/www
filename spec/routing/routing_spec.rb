require 'spec_helper'

describe 'routing' do

  it 'routes / to RootController#index' do
    expect( :get => '/' ).to route_to( :controller => 'root', :action => 'index' )
  end

end