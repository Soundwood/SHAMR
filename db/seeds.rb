# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


prof_a = TwitterProfile.create(username: 'realdonaldtrump', display_name: 'Donald J. Trump', user_id: 25073877, irreproachable: true) 
prof_b = TwitterProfile.create(username: 'barackobama', display_name: 'Barack Obama', user_id: 813286)
prof_c = TwitterProfile.create(username: 'katyperry', display_name: 'Katy Perry', user_id: 21447363, offender: true)
prof_d = TwitterProfile.create(username: 'rihanna', display_name: 'Rihanna', user_id: 79293791)
prof_e = TwitterProfile.create(username: 'justinbieber', display_name: 'Justin Bieber', user_id: 27260086)
prof_f = TwitterProfile.create(username: 'taylorswift13', display_name: 'Taylor Swift', user_id: 17919972, offender: true)
prof_g = TwitterProfile.create(username: 'TheEllenShow', display_name: 'Ellen DeGeneres', user_id: 15846407)
prof_h = TwitterProfile.create(username: 'kimkardashian', display_name: 'Kim Kardashian', user_id: 25365536)
prof_i = TwitterProfile.create(username: 'billgates', display_name: 'Bill Gates', user_id: 50393960)
prof_j = TwitterProfile.create(username: 'elonmusk', display_name: 'Elon Musk', user_id: 44196397, offender: true)
prof_k = TwitterProfile.create(username: 'britneyspears', display_name: 'Britney Spears', user_id: 16409683)
prof_l = TwitterProfile.create(username: 'shakira', display_name: 'Shakira', user_id: 44409004)


off_a = OffenseCategory.create(name: 'none')
off_b = OffenseCategory.create(name: 'use of customary units of measure')
off_c = OffenseCategory.create(name: 'incorrect pronunciation of gif')
off_d = OffenseCategory.create(name: 'does not include /s for sarcasm')
off_e = OffenseCategory.create(name: 'mows their lawn before 8AM')
off_f = OffenseCategory.create(name: 'slow-walker')
off_g = OffenseCategory.create(name: 'not using turn indicator')
off_h = OffenseCategory.create(name: 'loud chewer')

# TwitterProfile.find_by_id(1).offense_categories << OffenseCategory.find_by_id(3)
prof_a.offense_categories << off_a
prof_b.offense_categories << off_c
prof_c.offense_categories << off_d
prof_d.offense_categories << off_b
prof_e.offense_categories << off_f
prof_f.offense_categories << off_g
prof_g.offense_categories << off_c
prof_h.offense_categories << off_a
prof_i.offense_categories << off_h
prof_j.offense_categories << off_d
prof_k.offense_categories << off_a
prof_l.offense_categories << off_b
