require 'spec_helper'

describe 'root/index.html.erb' do

  before( :all ) do
    @github = t( :github, :scope => :application )
    @demo = t( :demo, :scope => :application )

    @spec_cat_title = t( :title, :scope => [ :projects, :spec_cat ] )
    @spec_cat_description = t( :description, :scope => [ :projects, :spec_cat ] )

    @status_cat_title = t( :title, :scope => [ :projects, :status_cat ] )
    @status_cat_description = t( :description, :scope => [ :projects, :status_cat ] )

    @meter_cat_title = t( :title, :scope => [ :projects, :meter_cat ] )
    @meter_cat_description = t( :description, :scope => [ :projects, :meter_cat ] )
  end

  before( :each ) do
    render
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

  describe 'meter-cat div' do

    it 'includes an h2 tag' do
      rendered.should have_selector( :h2, :content => @meter_cat_title )
    end

    it 'includes a description' do
      rendered.should have_selector( :p, :content => @meter_cat_description )
    end

    it 'includes a github link' do
      rendered.should have_selector( :a, :href => METER_CAT_GITHUB_URL, :content => @github )
    end

    it 'includes a demo link' do
      rendered.should have_selector( :a, :href => meter_cat_path, :content => @demo )
    end
  end

end