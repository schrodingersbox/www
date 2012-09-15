require 'spec_helper'

describe ApplicationController do

  it 'protects from forgery' do
    ApplicationController.request_forgery_protection_token.should_not be( nil )
  end

end