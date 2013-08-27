require 'spec_helper'

describe 'root/index.html.erb' do

  before( :all ) do
    @welcome = t( :welcome, :scope => [ :root, :index ] )
    @github = t( :github, :scope => [ :root, :index ] )
    @demo = t( :demo, :scope => [ :root, :index ] )

    @spec_cat_title = t( :title, :scope => [ :root, :index, :spec_cat ] )
    @spec_cat_description = t( :description, :scope => [ :root, :index, :spec_cat ] )

    @status_cat_title = t( :title, :scope => [ :root, :index, :status_cat ] )
    @status_cat_description = t( :description, :scope => [ :root, :index, :status_cat ] )
  end

  before( :each ) do
    render
  end

  it 'includes an h1 tag' do
    rendered.should have_selector( :h1, :content => @welcome )
  end

  describe 'spec-cat div' do

    it 'includes an h2 tag' do
      rendered.should have_selector( :h2, :content => @spec_cat_title )
    end

    it 'includes a description' do
      rendered.should have_selector( :p, :content => @spec_cat_description )
    end

    it 'includes a github link' do
      rendered.should have_selector( :a, :href => SPEC_CAT_GITHUB_URL, :content => @github )
    end

  end

  describe 'status-cat div' do

    it 'includes an h2 tag' do
      rendered.should have_selector( :h2, :content => @status_cat_title )
    end

    it 'includes a description' do
      rendered.should have_selector( :p, :content => @status_cat_description )
    end

    it 'includes a github link' do
      rendered.should have_selector( :a, :href => STATUS_CAT_GITHUB_URL, :content => @github )
    end

    it 'includes a demo link' do
      rendered.should have_selector( :a, :href => status_cat_path, :content => @demo )
    end
  end

end