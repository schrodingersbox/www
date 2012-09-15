# spec/coverage_spec.rb
#
# Ensures every eligible file under /app and /lib has a corresponding spec
################################################################################

require 'spec_helper'
require 'find'

describe 'coverage' do

  PRUNE = [ '.','..' ]

  it 'has a spec for every file under app and lib' do
    check_directory( File.join( Rails.root, 'app'  ) )
    check_directory( File.join( Rails.root, 'lib'  ) )
  end

protected

  def check_directory( directory )
    Find.find( directory ) do |path|
      path = path.sub( /#{Rails.root}\//, '' )
      Find.prune if should_prune?( path )
      check_file( path )
    end
  end

  def check_file( path )
    basename = File.basename( path, '.rb' ) + '_spec.rb'
    missing = File.join( dirname( path ), basename )
    missing.should be_false unless File.exists?( missing )
  end

  def dirname( path )
    name = File.dirname( path )
    name.gsub!( /^app/, 'spec' )
    name.gsub!( /^lib/, 'spec/lib' )
    return name
  end

  def is_partial?( basename )
    return basename =~ /^_/
  end

  def is_ruby?( basename )
    return basename =~ /\.rb$/ ||  basename =~ /\.erb$/
  end

  def should_prune?( path )
    basename = File.basename( path )

    return true if File.directory?( path )  # Prune directories
    return true if PRUNE.include?( path )   # Prune constants
    return true if is_partial?( basename )  # Prune partials
    return true unless is_ruby?( basename ) # Prune non-Ruby files

    return false
  end

end
