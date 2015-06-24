ActiveRecord::Base.establish_connection(
  ENV['DATABASE_URL']||'sqlite3:db/development.db')

class Gamedata < ActiveRecord::Base
end
