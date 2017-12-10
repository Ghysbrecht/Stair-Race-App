Admin.destroy_all
Leaderboard.destroy_all
Participant.destroy_all

Admin.create!([{
 name: "default@test.net",
 role: "shrug",
 password: "default"
}])

p "Created #{Admin.count} Admin(s)"