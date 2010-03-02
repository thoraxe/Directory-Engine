module DirectoryHelper

  def select_options_generator
    options_for_select(
      [["DISTANCE", 0], ["5 mi", 1], ["25 mi", 2], ["100 mi", 3], ["300 mi", 4], ["500 mi", 5], ["Any mi", 6]], 
      params[:distance].to_i)
  end

end
