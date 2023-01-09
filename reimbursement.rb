class Reimbursement
  attr_accessor :sequence

  TRAVEL_DAY_HIGH_COST = 55
  TRAVEL_DAY_LOW_COST = 45
  FULL_DAY_HIGH_COST = 85
  FULL_DAY_LOW_COST = 75

  def initialize(sequence)
    @sequence = sequence
  end

  def calculate_total_cost
    calculate_full_day_cost + calculate_travel_day_cost
  end

  def calculate_full_day_cost
    sequence.full_day_high_cost_count * FULL_DAY_HIGH_COST + sequence.full_day_low_cost_count * FULL_DAY_LOW_COST
  end

  def calculate_travel_day_cost
    sequence.travel_day_high_cost_count * TRAVEL_DAY_HIGH_COST + sequence.travel_day_low_cost_count * TRAVEL_DAY_LOW_COST
  end

  def to_s
    puts '-------------------------------------------'
    puts "Calculating #{sequence.name}"
    puts "  Travel Days : #{calculate_travel_day_cost}"
    puts "  Full Days : #{calculate_full_day_cost}"
    puts "  Total : #{calculate_total_cost}"
  end
  
end
