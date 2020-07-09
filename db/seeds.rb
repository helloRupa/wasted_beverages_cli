Beverage.destroy_all
User.destroy_all

jojo = User.create({ username: "jojo" })
stacey = User.create({ username: "stacey" })
bob = User.create({ username: "bob" })
jaime = User.create({ username: "jaime" })

Beverage.create({
  name: "aviation",
  strength: 4,
  user: jojo
})
Beverage.create({
  name: "long island",
  strength: 5,
  user: stacey
})
Beverage.create({
  name: "amf",
  strength: 5,
  user: bob
})
Beverage.create({
  name: "beer",
  strength: 3,
  user: jaime
})
Beverage.create({
  name: "wine",
  strength: 2,
  user: jaime
})