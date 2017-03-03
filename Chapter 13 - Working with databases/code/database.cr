# Open database
require "mysql"

DB.open "mysql://root@localhost/test" do |db|
  # db is a DB::Database
  # it manages the whole connection pool
  # ... use db to perform queries
end

# alternatively:
db = DB.open "mysql://root@localhost/test"
begin
  # ... use db to perform queries
ensure
  db.close
end

# Exec: execute statements
db.exec "create table contacts (name varchar(30), age int)"
db.exec "insert into contacts values (?, ?)", "John", 30
db.exec "insert into contacts values (?, ?)", "Sarah", 33

# Scalar:
max_age = db.scalar "select max(age) from contacts"

# Query:
db.query "select name, age from contacts order by age desc" do |rs|
  rs.each do
    # ... perform for each row in the ResultSet
    name = rs.read(String)
    age = rs.read(Int32)
    puts "#{name} (#{age})"
    # => Sarah (33)
    # => John Doe (30)
  end
end

# Read multiple columns at once:
name, age = rs.read(String, Int32)

# Read a single row:
name, age = db.query_one "select name, age from contacts order by age desc limit 1", 
                         as: { String, Int32 }

# Print the current time from MySQL, but if the connection is lost 
# or the whole server is down for a few seconds 
# the program will still run without raising exceptions
require "mysql"

# Configuring the connection pool
DB.open "mysql://root@localhost?retry_attempts=8&retry_delay=3" do |db|
  loop do
    pp db.scalar("SELECT NOW()")
    sleep 0.5
  end
end
