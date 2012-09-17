require 'spec_helper'

describe RootController do

  it 'gets the index' do
    get :index
    response.should be_success
  end

end