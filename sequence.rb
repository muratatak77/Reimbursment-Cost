class Sequence
  attr_accessor :name, :projects, :travel_day_high_cost_count, :travel_day_low_cost_count, :full_day_high_cost_count,
                :full_day_low_cost_count

  def initialize(name, projects)
    @name = name
    @projects = projects
    set_days_initial_value
    calculate_day_count
  end

  private

  def calculate_day_count
    curr = 0
    p_len = projects.length

    while curr < p_len
      prev_item = projects[curr - 1] || nil if curr > 0
      curr_item = projects[curr]
      next_item = projects[curr + 1] || nil if curr + 1 <= p_len
      city_type = curr_item.city_type.to_s

      # First calculating in the project requirements, we can calculate each cost day over the projects
      set_variable_add("@full_day_#{city_type}_count", curr_item.full_days_count)
      set_variable_add("@travel_day_#{city_type}_count", curr_item.travel_days_count)

      # Second, Calculating days relationship between each others
      if next_item
        # don't do anything because still we calculated in the first section, just next items calculating
        if curr_item.start_date == next_item.start_date && curr_item.end_date == next_item.end_date
          curr += 2
          next if curr + 1 <= p_len

        # If two projects push up against each other, or overlap, then those days are full days as well.
        elsif curr_item.end_date == next_item.start_date && curr_item.start_date != next_item.start_date
          set_variable_add_ext(city_type)
        end
      end

      # If two projects push up against each other, or overlap, then those days are full days as well.
      set_variable_add_ext(city_type) if prev_item && curr_item.start_date == prev_item.end_date
      curr += 1
    end
  end

  def set_variable_add_ext(city_type)
    set_variable_add("@full_day_#{city_type}_count", 1)
    set_variable_ext("@travel_day_#{city_type}_count", 1)
  end

  def set_days_initial_value
    @travel_day_high_cost_count = 0
    @travel_day_low_cost_count = 0
    @full_day_high_cost_count = 0
    @full_day_low_cost_count = 0
  end

	# we can use a dynamic variable set adding and extraction
  def set_variable_add(var_name, value)
    already = instance_variable_get(var_name)
    instance_variable_set(var_name, already + value)
  end

	# we can use a dynamic variable set adding and extraction
  def set_variable_ext(var_name, value)
    already = instance_variable_get(var_name)
    instance_variable_set(var_name, already - value)
  end
end
