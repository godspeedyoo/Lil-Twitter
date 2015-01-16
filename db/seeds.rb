User.create(
  username: "godspeedyoo",
  first_name: "Joseph",
  last_name: "Won",
  email: "godspeedyoo@gmail.com",
  password: "123"
  )

User.create(
  username: "paul",
  first_name: "Paul",
  last_name: "Yu",
  email: "paul@gmail.com",
  password: "123"
  )



User.first.tweets.create(content: "Tweeets")
