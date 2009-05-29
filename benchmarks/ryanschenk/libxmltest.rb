require 'rubygems'
require 'xml'

# I didn't use benchmark here because it was not yielding accurate results.

load_t_start = Time.now
doc = XML::Document.file("mus_musculus_esearch.xml")
load_t_end = Time.now

ids = [] 

xpath_t_start = Time.now
doc.find("/eSearchResult/IdList/Id").each {|n| ids << n.content}
xpath_t_end = Time.now


puts "XPath'd #{ids.length} nodes"
puts "Loading: #{load_time  = load_t_end - load_t_start} seconds",
     "XPath:   #{xpath_time = xpath_t_end - xpath_t_start} seconds",
     "Total:   #{load_time + xpath_time}"