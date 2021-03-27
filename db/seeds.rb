# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: "hivertester1@gmail.com",
  password: "dummy",
  refresh_token: "1//0gv-DfUok7rPtCgYIARAAGBASNwF-L9IrKAf9avNycZrl8zBQb921bZYAN0GwpNLPrVWwWy8prNnNcq5TmhNaGwhr32X69YlnYwg"
)

User.create(
  email: "hivertester2@gmail.com",
  password: "dummy",
  refresh_token: "1//0gwOz65zWMnU6CgYIARAAGBASNwF-L9IrHqMyZQeM58RG_plF2jsY8AF5usLO1btz-tbPDCEhBbt00ViEI81nT_zCnVbyLL7-stc"
)
