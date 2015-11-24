class School
  VERSION = 1
  def initialize
    @school = {}
  end

  def add(name, grade)
    (@school[grade] ||= []) << name
  end

  def grade(grade)
    (@school[grade] || []).sort
  end

  def to_h
    Hash[@school.sort].each { |k,v| v.sort! }
  end
end
