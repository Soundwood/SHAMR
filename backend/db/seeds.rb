# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


TwitterProfile.create(username: 'realdonaldtrump', display_name: 'Donald J. Trump', user_id: 25073877, protected: true) 
TwitterProfile.create(username: 'barackobama', display_name: 'Barack Obama')
TwitterProfile.create(username: 'katyperry', display_name: 'Katy Perry')
TwitterProfile.create(username: 'rihanna', display_name: 'Rihanna')
TwitterProfile.create(username: 'justinbieber', display_name: 'Justin Bieber')
TwitterProfile.create(username: 'taylorswift13', display_name: 'Taylor Swift', offender: true)
TwitterProfile.create(username: 'TheEllenShow', display_name: 'Ellen DeGeneres')
TwitterProfile.create(username: 'kimkardashian', display_name: 'Kim Kardashian')
TwitterProfile.create(username: 'billgates', display_name: 'Bill Gates')
TwitterProfile.create(username: 'elonmusk', display_name: 'Elon Musk', offender: true)
TwitterProfile.create(username: 'britneyspears', display_name: 'Britney Spears')
TwitterProfile.create(username: 'shakira', display_name: 'Shakira')


OffenseCategory.create(name: 'none')
OffenseCategory.create(name: 'use of customary units of measure')
OffenseCategory.create(name: 'incorrect pronunciation of gif')
OffenseCategory.create(name: 'does not include /s for sarcasm')
OffenseCategory.create(name: 'mows their lawn before 8AM')
OffenseCategory.create(name: 'slow-walker')
OffenseCategory.create(name: 'not using turn indicator')
OffenseCategory.create(name: 'loud chewer')

# TwitterProfile.find_by_id(1).offense_categories << OffenseCategory.find_by_id(3)
