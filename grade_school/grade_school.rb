class School
  def initialize
    @roster = Hash.new { |roster, grade_id| roster[grade_id] = [] }
  end

  def to_h
    @roster.sort.to_h
  end

  def add(name, grade_id)
    @roster[grade_id] << name
    @roster[grade_id].sort!
  end

  def grade(grade_id)
    @roster[grade_id]
  end
end
