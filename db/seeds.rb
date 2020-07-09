Beverage.destroy_all
User.destroy_all

jojo = User.create({ username: "jojo" })
stacey = User.create({ username: "stacey" })
bob = User.create({ username: "bob" })
jaime = User.create({ username: "jaime" })

Beverage.create({ title: "aviation", strength: 4, user: jojo })
Beverage.create({ title: "long island", strength: 5, user: stacey })
Beverage.create({ title: "amf", strength: 5, user: bob })
Beverage.create({ title: "beer", strength: 3, user: jaime })
Beverage.create({ title: "wine", strength: 2, user: jaime })