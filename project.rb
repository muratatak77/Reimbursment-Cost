require 'date'

class Project
  attr_accessor :name, :start_date, :end_date, :city_type
  attr_reader :full_days_count, :travel_days_count

  def initialize(name, city_type, start_date, end_date)
    @name = name
    @start_date = start_date
    @end_date = end_date
    @city_type = city_type
  end

  def full_days_count
    full_days_count = full_days
  end

  def travel_days_count
    travel_days_count = travel_days
  end

  private

  # travel days first and the last date of project.
	# other rules here push up against each other, then days are full days 
  def travel_days
    return 0 if start_date == end_date

    2
  end

  # full days = if equal first and last day just called full days
  # push up against each other those days are full days
  def full_days
    return 1 if start_date == end_date

    diff = to_date(end_date) - to_date(start_date)
    diff.to_i - 1
  end

  #  we need date utils to convert to str to date calculating day counts.
  def to_date(str)
    return nil if str.nil?

    Date.strptime(str, '%m/%d/%y')
  end
end
