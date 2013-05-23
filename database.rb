require 'mongo'
include Mongo

# Initializing the database
def db_init
  $client = MongoClient.new('localhost', 27017)
  $database = $client['thepublicblog-db']
  $posts = $database['posts']
end

# Adding a post
def db_add_post(title, author, body)
  author = (author == '' or author == nil) ? 'Anonymous' : author
  if title == '' or author == '' or body == ''
    return
  end

  $posts.save({
    title: title,
    author: author,
    body: body
  })
end

# Querying for a variable
def db_find(query=nil)
  return $posts.find(query)
end

# Removing a variable
def db_remove(query=nil)
  return $posts.find(query)
end