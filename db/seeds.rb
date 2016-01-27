# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

company = Company.create(name:     'Campus Code',
                         location: 'São Paulo',
                         mail:     'contato@campuscode.com.br',
                         phone:    '2369-3476')

category = Category.create(name: 'Desenvolvedor')

job = Job.create(title: 'Vaga de Dev',
                 description: 'Dev Junior Rails com ao menos um projeto',
                 location: 'São Paulo',
                 company: company,
                 category: category)
