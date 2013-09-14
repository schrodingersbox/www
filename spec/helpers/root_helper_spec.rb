require 'spec_helper'

describe RootHelper do

  describe '#root_project' do

    before( :each ) do
      @name = :status_cat
      @github = 'https://github.com/schrodingersbox/status_cat'
      @demo = '/status_cat'
      @expected = { :partial => 'root/project', :locals => { :name => @name, :github => @github, :demo => @demo } }
    end

    it 'renders the project partial with the given locals' do
      helper.should_receive( :render ).with( hash_including( @expected ) )
      helper.root_project( @name, @github, @demo )
    end

  end

end