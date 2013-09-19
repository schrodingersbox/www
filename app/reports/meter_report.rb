include ReportCat::Core
include ReportCat::Reports

class MeterReport < DateRangeReport

  def initialize
    table_name = MeterCat::Meter.table_name

    super(
        :name => :meter_report,
        :joins => 'left ' + ReportCat::DateRange.join_to( table_name, :created_on )
    )

    add_column( :total, :integer, :sql => "sum(#{table_name}.value)")

    add_chart( :bar_chart, :bar, :start_date, :total )
  end

end
