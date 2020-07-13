# frozen_string_literal: true

BeverageAlcohol.destroy_all
Alcohol.destroy_all
Beverage.destroy_all
User.destroy_all

guest = User.create(username: 'Guest')
jojo = User.create(username: 'jojo')
stacey = User.create(username: 'stacey')
bob = User.create(username: 'bob')
jaime = User.create(username: 'jaime')
sylvis = User.create(username: 'Sylvis')
fresh = User.create(username: 'fresh')
lana = User.create(username: 'lana')
noel = User.create(username: 'Noel')

tequila = Alcohol.create(kind: 'tequila')
mezcal = Alcohol.create(kind: 'mezcal')
vodka = Alcohol.create(kind: 'vodka')
whiskey = Alcohol.create(kind: 'whiskey')
scotch = Alcohol.create(kind: 'scotch')
bourbon = Alcohol.create(kind: 'bourbon')
rum = Alcohol.create(kind: 'rum')
gin = Alcohol.create(kind: 'gin')
beer = Alcohol.create(kind: 'beer')
wine = Alcohol.create(kind: 'wine')
seltzer = Alcohol.create(kind: 'seltzer')
brandy = Alcohol.create(kind: 'brandy')
sake = Alcohol.create(kind: 'sake')
soju = Alcohol.create(kind: 'soju')
cider = Alcohol.create(kind: 'cider')
absinthe = Alcohol.create(kind: 'absinthe')
moonshine = Alcohol.create(kind: 'moonshine')
vermouth = Alcohol.create(kind: 'vermouth')

sour_beer = Beverage.create(name: 'sour', strength: 3)
UserBeverage.create(user: guest, beverage: sour_beer)
BeverageAlcohol.create(beverage: sour_beer, alcohol: beer)

margarita = Beverage.create(name: 'margarita', strength: 3)
UserBeverage.create(user: guest, beverage: margarita)
BeverageAlcohol.create(beverage: margarita, alcohol: tequila)

old_fashioned = Beverage.create(name: 'old fashioned', strength: 4)
UserBeverage.create(user: guest, beverage: old_fashioned)
BeverageAlcohol.create(beverage: old_fashioned, alcohol: whiskey)

aviation = Beverage.create(name: 'aviation', strength: 4)
UserBeverage.create(user: jojo, beverage: aviation)
BeverageAlcohol.create(beverage: aviation, alcohol: gin)

corpse_reviver = Beverage.create(name: 'corpse reviver', strength: 5)
UserBeverage.create(user: jojo, beverage: corpse_reviver)
BeverageAlcohol.create(beverage: corpse_reviver, alcohol: absinthe)
BeverageAlcohol.create(beverage: corpse_reviver, alcohol: gin)

long_island = Beverage.create(name: 'long island', strength: 5)
UserBeverage.create(user: stacey, beverage: long_island)
BeverageAlcohol.create(beverage: long_island, alcohol: vodka)
BeverageAlcohol.create(beverage: long_island, alcohol: tequila)
BeverageAlcohol.create(beverage: long_island, alcohol: rum)
BeverageAlcohol.create(beverage: long_island, alcohol: gin)

sangria = Beverage.create(name: 'sangria', strength: 2)
UserBeverage.create(user: stacey, beverage: sangria)
BeverageAlcohol.create(beverage: sangria, alcohol: wine)

amf = Beverage.create(name: 'amf', strength: 5)
UserBeverage.create(user: bob, beverage: amf)
BeverageAlcohol.create(beverage: amf, alcohol: vodka)
BeverageAlcohol.create(beverage: amf, alcohol: tequila)
BeverageAlcohol.create(beverage: amf, alcohol: rum)
BeverageAlcohol.create(beverage: amf, alcohol: gin)

ipa = Beverage.create(name: 'ipa', strength: 4)
UserBeverage.create(user: jaime, beverage: ipa)
BeverageAlcohol.create(beverage: ipa, alcohol: beer)

red_wine = Beverage.create(name: 'red wine', strength: 2)
UserBeverage.create(user: jaime, beverage: red_wine)
BeverageAlcohol.create(beverage: red_wine, alcohol: wine)

holiday_hooch = Beverage.create(name: 'holiday hooch', strength: 4)
UserBeverage.create(user: jaime, beverage: holiday_hooch)
BeverageAlcohol.create(beverage: holiday_hooch, alcohol: moonshine)

white_claw = Beverage.create(name: 'white claw', strength: 2)
UserBeverage.create(user: sylvis, beverage: white_claw)
BeverageAlcohol.create(beverage: white_claw, alcohol: seltzer)

nigori = Beverage.create(name: 'nigori', strength: 2)
UserBeverage.create(user: sylvis, beverage: nigori)
BeverageAlcohol.create(beverage: nigori, alcohol: sake)

angry_orchard = Beverage.create(name: 'angry_orchard', strength: 2)
UserBeverage.create(user: sylvis, beverage: angry_orchard)
BeverageAlcohol.create(beverage: angry_orchard, alcohol: cider)

oaxacan_old_fashioned =
  Beverage.create(name: 'oaxacan old fashioned', strength: 4)
UserBeverage.create(user: fresh, beverage: oaxacan_old_fashioned)
BeverageAlcohol.create(beverage: oaxacan_old_fashioned, alcohol: tequila)
BeverageAlcohol.create(beverage: oaxacan_old_fashioned, alcohol: mezcal)

single_malt = Beverage.create(name: 'single malt scotch', strength: 5)
UserBeverage.create(user: lana, beverage: single_malt)
BeverageAlcohol.create(beverage: single_malt, alcohol: scotch)

cognac = Beverage.create(name: 'cognac', strength: 5)
UserBeverage.create(user: lana, beverage: cognac)
BeverageAlcohol.create(beverage: cognac, alcohol: brandy)

manhattan = Beverage.create(name: 'manhattan', strength: 5)
UserBeverage.create(user: lana, beverage: manhattan)
BeverageAlcohol.create(beverage: manhattan, alcohol: whiskey)
BeverageAlcohol.create(beverage: manhattan, alcohol: vermouth)

kentucky_mule = Beverage.create(name: 'kentucky mule', strength: 4)
UserBeverage.create(user: noel, beverage: kentucky_mule)
BeverageAlcohol.create(beverage: kentucky_mule, alcohol: bourbon)

somaek = Beverage.create(name: 'somaek', strength: 2)
UserBeverage.create(user: noel, beverage: somaek)
BeverageAlcohol.create(beverage: somaek, alcohol: beer)
BeverageAlcohol.create(beverage: somaek, alcohol: soju)
