require 'csv'

class OrderParserService
  def initialize(file)
    #return nil unless check_file(file)
    @file = file
    check_dir
    write_file
    @uploaded_file = read_file
  end

  def parse_tab_separated
    collection = []
    tsv = CSV.parse(@uploaded_file.read, col_sep: "\t", headers: true)
    tsv.each do |row|
      collection << row.to_hash
    end
    collection
  end

  private

  def check_file(file)
    (tab_extension && file.exists) ? true : false
  end

  def check_dir
    dir = Rails.root.join('public', 'uploads')
    FileUtils.mkdir_p(dir) unless File.directory?(dir)
  end

  def write_file
    File.open(Rails.root.join('public', 'uploads', @file.original_filename), 'wb') do |file|
      file.write(@file.read)
    end
  end

  def read_file
    File.open(Rails.root.join('public', 'uploads', @file.original_filename), 'r')
  end

  def tab_extension

  end
end