User.create(
  username: "godspeedyoo",
  first_name: "Joseph",
  last_name: "Won",
  email: "godspeedyoo@test.com",
  password: "123"
  )

User.create(
  username: "paul",
  first_name: "Paul",
  last_name: "Yu",
  email: "paul@test.com",
  password: "123"
  )



User.first.tweets.create(content: "Tweeets")
