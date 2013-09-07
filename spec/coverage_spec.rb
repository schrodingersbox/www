# coverage_spec.rb
#
# Ensures every eligible file has a corresponding spec
################################################################################

require 'spec_helper'

describe 'coverage' do

  it 'has a spec for every file' do
    [
      'app/controllers',
      'app/helpers',
      'app/mailers',
      'app/models',
      'app/views',
      'lib'
    ].each do |dir|
      Dir.glob( File.join( Rails.root, dir, '**', '*.{rb,erb}' ) ) do |path|
        next if File.basename( path ) =~ /^_/
        path.sub!( /#{Rails.root}\//, '' ).should have_a_spec
      end
    end
  end

end
