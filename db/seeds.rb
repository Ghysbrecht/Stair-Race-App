

Admin.create!([{
 name: "default@test.net",
 role: "shrug",
 password: "default"
}])

p "Created #{Admin.count} Admin(s)"
