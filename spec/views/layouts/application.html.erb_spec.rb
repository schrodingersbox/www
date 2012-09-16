require 'spec_helper'

describe '/layouts/application.html.erb' do

  it 'renders without exception' do
    render
  end

  it 'includes a title tag' do
    render
    rendered.should have_selector( :title, :content => t( :title, :scope => :application )  )
  end

end
