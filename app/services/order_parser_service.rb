class OrderParser
  def initialize(file)
    return nil unless check_file(file)
    @file = file
  end

  def parse_tab_separated

  end

  private

  def check_file_extension(file)
    (tab_extension && file.exists) ? true : false
  end
end