module RootHelper

  def root_project( name, github = nil, demo = nil )
    render :partial => 'project', :locals => { :name => name, :github => github, :demo => demo }
  end

end
