# Pre-populate data for admin roles and pre-determined courses from Launch School

courses = [
  {course_name: 'RB 101-109'},
  {course_name: 'RB 121-129'},
  {course_name: 'RB 130-139'},
  {course_name: 'LS 170-171'},
  {course_name: 'RB 175'},
  {course_name: 'JS 175'},
  {course_name: 'LS 180-181'},
  {course_name: 'RB 185'},
  {course_name: 'JS 101-109 & 210-211'},
  {course_name: 'LS 215-216'},
  {course_name: 'JS 120-129 & 225-229'},
  {course_name: 'JS 130-139'},
  {course_name: 'JS 230-239'},
  {course_name: 'Advanced JS (130+ & 225+)'}
]

courses.each do |course|
  Course.create(course)
end