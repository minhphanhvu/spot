# Pre-populate data for admin roles and pre-determined courses from Launch School

# Pre-populate data for admin roles and pre-determined courses from Launch School

courses = [
  {name: 'RB 101-109'},
  {name: 'RB 121-129'},
  {name: 'RB 130-139'},
  {name: 'LS 170-171'},
  {name: 'RB 175'},
  {name: 'JS 175'},
  {name: 'LS 180-181'},
  {name: 'RB 185'},
  {name: 'JS 101-109 & 210-211'},
  {name: 'LS 215-216'},
  {name: 'JS 120-129 & 225-229'},
  {name: 'JS 130-139'},
  {name: 'JS 230-239'},
  {name: 'Advanced JS (130+ & 225+)'}
]

courses.each do |course|
  Course.create(course)
end

# Pre-populat database with users;
# Jenae is admin and lead;
# Jemima, Minh and Radu are leads, and the rest are just students.
users = [
  {username: 'jenae', password_digest: 'jenae', is_lead: 'true', is_admin: 'true'},
  {username: 'jemima', password_digest: 'jemima', is_lead: 'true', is_admin: 'false'},
  {username: 'minh', password_digest: 'minh', is_lead: 'true', is_admin: 'false'},
  {username: 'radu', password_digest: 'radu', is_lead: 'true', is_admin: 'false'},
  {username: 'mike', password_digest: 'mike', is_lead: 'false', is_admin: 'false'},
  {username: 'robert', password_digest: 'robert', is_lead: 'false', is_admin: 'false'},
  {username: 'maria', password_digest: 'maria', is_lead: 'false', is_admin: 'false'},
  {username: 'diana', password_digest: 'diana', is_lead: 'false', is_admin: 'false'},
  {username: 'alex', password_digest: 'alex', is_lead: 'false', is_admin: 'false'},
  {username: 'gabe', password_digest: 'gabe', is_lead: 'false', is_admin: 'false'},
]

users.each do |user|
  User.create(user)
end

# Pre-populaate db with spots.
# Only leads with id 1-3 have sessions registered, lead id 4 has no session
# Change the week_beginning, session_datetime, and date_created up to one more week to cover the local time
# date_created starts on Saturday, week_beginning starts on Sunday, session_datetime starts on Thursday.

spots = [
  {lead_id: 1, course_id: 1, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 1, course_id: 2, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 1, course_id: 3, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 1, course_id: 2, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 2, course_id: 1, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 2, course_id: 1, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 2, course_id: 3, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 2, course_id: 4, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 3, course_id: 4, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 3, course_id: 3, week_beginning: '2021-03-07', session_datetime: '2021-03-11 19:00', student_limit: 5, date_created: '2021-03-06'},
  {lead_id: 1, course_id: 1, week_beginning: '2021-02-28', session_datetime: '2021-03-04 19:00', student_limit: 5, date_created: '2021-02-27', archive: 'true'},
  {lead_id: 1, course_id: 2, week_beginning: '2021-02-28', session_datetime: '2021-03-04 19:00', student_limit: 5, date_created: '2021-02-27', archive: 'true'},
  {lead_id: 1, course_id: 3, week_beginning: '2021-02-28', session_datetime: '2021-03-04 19:00', student_limit: 5, date_created: '2021-02-27', archive: 'true'}
]

spots.each do |spot|
  Spot.create(spot)
end

# Populate spot_students table
# Users id (student_id) 5, 6, and 7 will register for RB101-109 (spot_id 1, 5, 6, 11)
# Users id (student_id) 8, 9 will register for RB121-129 (spot_id 2, 4, 12). spot_id 12 is in archive (already finished session)
# Users id (student_id) 10 will register for RB130-139 (spot_id 3, 7, 10, and 13). spot_id 13 is in archive (already finished session)
# ...spot_id 7 and 10 will not have students registered (empty sessions)
# All spots with course_id (4) (spot_id 8 and 9) which is LS170-171 will not have students registered

spot_students = [
  {spot_id: 1, student_id: 5},
  {spot_id: 1, student_id: 6},
  {spot_id: 1, student_id: 7},
  {spot_id: 5, student_id: 5},
  {spot_id: 5, student_id: 6},
  {spot_id: 6, student_id: 5},
  {spot_id: 11, student_id: 5},
  {spot_id: 11, student_id: 6},
  {spot_id: 2, student_id: 8},
  {spot_id: 2, student_id: 9},
  {spot_id: 4, student_id: 8},
  {spot_id: 4, student_id: 9},
  {spot_id: 12, student_id: 9},
  {spot_id: 3, student_id: 10},
  {spot_id: 13, student_id: 10}
]

spot_students.each do |student_spot|
  SpotStudent.create(student_spot)
end
