require 'spec_helper'

describe ReportCatController do

  describe '/index' do

    it 'gets the index' do
      get :index
      response.should be_success
    end

  end

end