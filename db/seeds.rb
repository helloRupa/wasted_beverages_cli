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

sour_beer = Beverage.create(
  name: 'sour',
  strength: 3,
  user: guest
)

margarita = Beverage.create(
  name: 'margarita',
  strength: 3,
  user: guest
)

old_fashioned = Beverage.create(
  name: 'old fashioned',
  strength: 4,
  user: guest
)

aviation = Beverage.create(
  name: 'aviation',
  strength: 4,
  user: jojo
)

corpse_reviver = Beverage.create(
  name: 'corpse reviver',
  strength: 5,
  user: jojo
)

long_island = Beverage.create(
  name: 'long island',
  strength: 5,
  user: stacey
)

sangria = Beverage.create(
  name: 'sangria',
  strength: 2,
  user: stacey
)

amf = Beverage.create(
  name: 'amf',
  strength: 5,
  user: bob
)

ipa = Beverage.create(
  name: 'ipa',
  strength: 4,
  user: jaime
)

red_wine = Beverage.create(
  name: 'red wine',
  strength: 2,
  user: jaime
)

holiday_hooch = Beverage.create(
  name: 'holiday hooch',
  strength: 4,
  user: jaime
)

white_claw = Beverage.create(
  name: 'white claw',
  strength: 2,
  user: sylvis
)

nigori = Beverage.create(
  name: 'nigori',
  strength: 2,
  user: sylvis
)

angry_orchard = Beverage.create(
  name: 'angry_orchard',
  strength: 2,
  user: sylvis
)

oaxacan_old_fashioned = Beverage.create(
  name: 'oaxacan old fashioned',
  strength: 4,
  user: fresh
)

single_malt = Beverage.create(
  name: 'single malt scotch',
  strength: 5,
  user: lana
)

cognac = Beverage.create(
  name: 'cognac',
  strength: 5,
  user: lana
)

manhattan = Beverage.create(
  name: 'manhattan',
  strength: 5,
  user: lana
)

kentucky_mule = Beverage.create(
  name: 'kentucky mule',
  strength: 4,
  user: noel
)

somaek = Beverage.create(
  name: 'somaek',
  strength: 2,
  user: noel
)

BeverageAlcohol.create(beverage: sour_beer, alcohol: beer)
BeverageAlcohol.create(beverage: margarita, alcohol: tequila)
BeverageAlcohol.create(beverage: old_fashioned, alcohol: whiskey)
BeverageAlcohol.create(beverage: aviation, alcohol: gin)
BeverageAlcohol.create(beverage: corpse_reviver, alcohol: absinthe)
BeverageAlcohol.create(beverage: corpse_reviver, alcohol: gin)
BeverageAlcohol.create(beverage: long_island, alcohol: vodka)
BeverageAlcohol.create(beverage: long_island, alcohol: tequila)
BeverageAlcohol.create(beverage: long_island, alcohol: rum)
BeverageAlcohol.create(beverage: long_island, alcohol: gin)
BeverageAlcohol.create(beverage: sangria, alcohol: wine)
BeverageAlcohol.create(beverage: amf, alcohol: vodka)
BeverageAlcohol.create(beverage: amf, alcohol: tequila)
BeverageAlcohol.create(beverage: amf, alcohol: rum)
BeverageAlcohol.create(beverage: amf, alcohol: gin)
BeverageAlcohol.create(beverage: ipa, alcohol: beer)
BeverageAlcohol.create(beverage: red_wine, alcohol: wine)
BeverageAlcohol.create(beverage: holiday_hooch, alcohol: moonshine)
BeverageAlcohol.create(beverage: white_claw, alcohol: seltzer)
BeverageAlcohol.create(beverage: nigori, alcohol: sake)
BeverageAlcohol.create(beverage: angry_orchard, alcohol: cider)
BeverageAlcohol.create(beverage: oaxacan_old_fashioned, alcohol: tequila)
BeverageAlcohol.create(beverage: oaxacan_old_fashioned, alcohol: mezcal)
BeverageAlcohol.create(beverage: single_malt, alcohol: scotch)
BeverageAlcohol.create(beverage: cognac, alcohol: brandy)
BeverageAlcohol.create(beverage: kentucky_mule, alcohol: bourbon)
BeverageAlcohol.create(beverage: somaek, alcohol: beer)
BeverageAlcohol.create(beverage: somaek, alcohol: soju)
BeverageAlcohol.create(beverage: manhattan, alcohol: whiskey)
BeverageAlcohol.create(beverage: manhattan, alcohol: vermouth)
