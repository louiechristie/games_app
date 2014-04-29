# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "John Smith", email: "john@smith.com")
User.create(name: "Joe Bloggs", email: "joe@bloggs.com")
Game.create(challenger_id: 1, invitee_id: 2)
Move.create(game_id: 1, user_id: 1, square: 4)
Move.create(game_id: 1, user_id: 2, square: 6)
Move.create(game_id: 1, user_id: 1, square: 2)
Move.create(game_id: 1, user_id: 2, square: 8)
Move.create(game_id: 1, user_id: 1, square: 7)
Move.create(game_id: 1, user_id: 2, square: 3)
Move.create(game_id: 1, user_id: 1, square: 1)