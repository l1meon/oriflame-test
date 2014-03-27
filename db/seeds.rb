# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = Category.create([{id: 1,name: 'для лица', name_ro: 'piele'},{id: 2,name: 'макияж', name_ro: 'machiaj'},{id: 3,name: 'парфюмерия', name_ro: 'parfumuri'},
                            {id: 4,name: 'для тела', name_ro: 'corp'},
                            {id: 5,name: 'для волос', name_ro: 'par'},{id: 6,name: 'акссесуары', name_ro: 'accesorii'},
                            {id: 7,name: 'для мужчин', name_ro: 'pentru barbati'},{id: 8,name: 'very me', name_ro: 'very me'},{id: 9,name: 'wellness', name_ro: 'wellness'}])
