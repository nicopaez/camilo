##
# A MySQL connection:
# DataMapper.setup(:default, 'mysql://user:password@localhost/the_database_name')
#
# # A Postgres connection:
# DataMapper.setup(:default, 'postgres://user:password@localhost/the_database_name')
#
# # A Sqlite3 connection
# DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "development.db"))
#

DataMapper.logger = logger
DataMapper::Property::String.length(255)

case Padrino.env
  when :development then DataMapper.setup(:default, "sqlite3::memory:")  
  #when :test        then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "camilo_test.db"))
  when :test        then DataMapper.setup(:default, "sqlite3::memory:")  
  #when :travis      then DataMapper.setup(:default, "mysql://root@localhost/camilo_test")
  when :travis        then DataMapper.setup(:default, "sqlite3::memory:")  
 	when :staging 		then DataMapper.setup(:default, ENV['DATABASE_URL'])
  when :production  then DataMapper.setup(:default, ENV['DATABASE_URL'])
end
