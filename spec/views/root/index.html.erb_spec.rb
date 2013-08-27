require 'spec_helper'

describe 'root/index.html.erb' do

  it 'includes an h1 tag' do
    render
    rendered.should have_selector( :h1, :content => t( :welcome, :scope => [ :root, :index ] )  )
  end

end