
require 'sinatra'

$main_storage = ['Some', 'Dummy', 'Posts']

get '/' do
  erb :viewall, :locals => { :posts => $main_storage }
end

get '/new' do
  '<form method="post">
   Post:<br>
   <input type="text" name="message">
   <input type="submit" value="Submit">
   </form>'
end

get '/:id' do
  erb :viewone, :locals => { :posts => $main_storage, :id => params[:id] }
end

post '/new' do
  $main_storage.push(params[:message])
  "You posted '#{params[:message]}'
  <meta http-equiv='refresh' content='1; url=/' />"
end
