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

#Pre-populat database with users;
#Jenae is admin and lead;
#Jemima, Minh and Radu are leads, and the rest are just students.
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

