class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @rows    = build_rows(matrix_string)
    @columns = rows.transpose
  end

  def saddle_points
    rows.each_with_index.each_with_object([]) do |(row, x), result|
      row.each_index do |y|
        column = columns[y]
        result << [x, y] if saddle_point?(column, row)
      end
    end
  end

private
  def saddle_point?(column, row)
    row.max == column.min
  end

  def build_rows(matrix_string)
    matrix_string.split("\n").map do |row_string|
      row_string.split.map(&:to_i)
    end
  end
end
