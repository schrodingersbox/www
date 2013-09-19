require 'spec_helper'

describe MeterReport do

  describe '#initialize' do

    before( :each ) do
      @report = MeterReport.new
    end

    it 'initializes a name' do
      @report.name.should eql( :meter_report )
    end

    it 'left joins the date ranges' do
      expected = "left join meter_cat_meters on date( meter_cat_meters.created_on ) between report_cat_date_ranges.start_date and report_cat_date_ranges.stop_date"
      @report.joins.should eql( expected )
    end

    it 'adds a total column' do
      @report.column( :total ).should be_present
    end

    it 'adds a bar chart' do
      @report.charts.size.should eql( 1 )
    end

  end

end