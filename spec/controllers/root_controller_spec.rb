require 'spec_helper'

describe RootController do

  describe '/index' do

    it 'gets the index' do
      get :index
      response.should be_success
    end

    it 'increments the :root_index meter' do
      MeterCat.should_receive( :add ).with( :root_index )
      get :index
    end

  end

end