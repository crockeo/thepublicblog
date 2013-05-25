require './database'
require './utils'

require 'sinatra'
require 'haml'

####
# Configuration
config = {
  bind: '127.0.0.1',
  port: 8000
}

config.each { |k, v| set(k, v) }

db_init

####
# GET requests
get('/') { haml :index }
get('/index') { haml :index }
get('/addpost') { haml :addpost }

####
# POST requests
post('/') do
  db_add_post(params[:title], params[:author], params[:body])
  haml :index
end

####
# RESTful API
get('/restapi/getposts') do
  content_type 'application/json'
  body utils_construct_json(db_find)
end

get('/restapi/getposts/bytitle/:title') do |title|
  content_type 'application/json'
  body utils_construct_json(db_find({title: title}))
end

get('/restapi/getposts/byauthor/:author') do |author|
  content_type 'application/json'
  body utils_construct_json(db_find({author: author}))
end

get('/restapi/getposts/bybody/:body') do |body|
  content_type 'application/json'
  body utils_construct_json(db_find({body: body}))
end

####
# Other
get('/*') { haml :error404 }