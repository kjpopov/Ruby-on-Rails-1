
require 'sinatra'
require 'sqlite3'

def db_connect
  SQLite3::Database.new 'myblog.db'
end

get '/' do
  erb :viewall, locals: { posts: db_connect }
end

get '/new' do
  '<form method="post">
   Post:<br>
   <input type="text" name="blogger" maxlength="8" size="8"><br>
   <TEXTAREA name="message" maxlength="255" size="255"
   ROWS="15" COLS="25"></TEXTAREA><BR>
   <input type="submit" value="Submit">
   </form>'
end

get '/:id' do
  erb :viewone, locals: { posts: db_connect, id: params[:id] }
end

delete '/:id' do
  db_connect.execute(
    'DELETE FROM myposts WHERE id=?',
    [params[:id]])
  "You Deleted a post: #{params[:id]}
  <meta http-equiv='refresh' content='1; url=/' />"
end

post '/new' do
  db_connect.execute(
    'INSERT INTO myposts(name, post) VALUES (?, ?)',
    [params[:blogger], params[:message]])
  "You posted '#{params[:message]}'
  <meta http-equiv='refresh' content='1; url=/' />"
end
