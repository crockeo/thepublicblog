require 'json'

# Constructing JSON from a Ruby array
def utils_construct_json(mongocursor)
  str = '['
  mongocursor.each do |res|
    str += '%s' % res.to_json
    if mongocursor.has_next?
      str += ', '
    end
  end

  return str + ']'
end