
require 'sqlite3'

db = SQLite3::Database.new 'myblog.db'

db.execute <<-SQL
  create table myposts (
    id INTEGER,
    name varchar(30),
    post varchar(255),
    PRIMARY KEY(id)
  );
SQL

db.execute(
  'INSERT INTO myposts(name, post) VALUES (?, ?)',
  ['Dummyman', 'This is a dummu post'])

db.execute(
  'INSERT INTO myposts(name, post) VALUES (?, ?)',
  ['Dummyman2', 'This is a dummu post 2'])
