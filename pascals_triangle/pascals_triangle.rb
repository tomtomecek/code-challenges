class Triangle
  def initialize(total_rows)
    @rows = Array.new(total_rows) { [1] }
  end

  def rows
    @rows.each_with_index do |row, idx|
      next if idx == 0
      populate_row_with_pascal_numbers(row, idx)
    end
  end

private
  def populate_row_with_pascal_numbers(row, idx)
    previous_row(idx).each_cons(2) { |a, b| row << (a + b) }
  end

  def previous_row(idx)
    @rows[idx-1] + [0]
  end
end
