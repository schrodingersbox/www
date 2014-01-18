require 'spec_helper'

describe ApplicationController do

  it 'protects from forgery' do
    ApplicationController.request_forgery_protection_token.should_not be( nil )
  end

  it 'uses the LandingCat Google Analytics helper' do
    expect( @controller._helpers.included_modules.include?( LandingCat::GoogleAnalyticsHelper ) ).to be_true
  end

end