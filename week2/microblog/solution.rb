
require 'sinatra'
require 'sqlite3'

$db = SQLite3::Database.new "myblog.db"

get '/' do
  erb :viewall, :locals => { :posts => $db }
end

get '/new' do
  '<form method="post">
   Post:<br>
   <input type="text" name="blogger" maxlength="8" size="8"><br>
   <TEXTAREA name="message" maxlength="255" size="255" ROWS="15" COLS="25"></TEXTAREA><BR>
   <input type="submit" value="Submit">
   </form>'
end

get '/:id' do
  erb :viewone, :locals => { :posts => $db, :id => params[:id] }
end

delete '/:id' do
  'you can not delete your facebook'
end

post '/new' do
  $db.execute("INSERT INTO myposts(name, post) VALUES (?, ?)", [params[:blogger], params[:message]])
  "You posted '#{params[:message]}'
  <meta http-equiv='refresh' content='1; url=/' />"
end
