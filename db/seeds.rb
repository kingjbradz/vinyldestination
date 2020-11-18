User.create!([
  {email: "test@best.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "testomesto"},
  {email: "number@2.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "number2"}
])
Vinyl.create!([
  {title: "Test Record", artist: "Test Artist", label: "Not A Real Label", genre: "Breaks", year: 2012, quality: "VG", price: 1.0, description: "", availability: true, user_id: 1}
])
Role.create!([
  {name: "collector", resource_type: nil, resource_id: nil},
  {name: "admin", resource_type: nil, resource_id: nil}
])
User::HABTM_Roles.create!([
  {user_id: 1, role_id: 1},
  {user_id: 1, role_id: 2},
  {user_id: 2, role_id: 1}
])
Role::HABTM_Users.create!([
  {user_id: 1, role_id: 1},
  {user_id: 1, role_id: 2},
  {user_id: 2, role_id: 1}
])
