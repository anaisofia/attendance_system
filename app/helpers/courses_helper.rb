module CoursesHelper
  def display_teachers(teachers)
    list = "<ol>"
    teachers.each do |teacher|
      list += "<li> #{teacher} </li>"
    end
    list += "</ol>"
    return list.html_safe
  end

  def display_students(students)
    list = "<ol>"
    students.each do |student|
      list += "<li> #{student} </li>"
    end
    list += "</ol>"
    return list.html_safe
  end
end
