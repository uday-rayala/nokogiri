require 'rexml/document'

# I didn't use benchmark here because it was not yielding accurate results.


print 'Um...are you sure you REALLY want to do this? [yN] '
exit unless gets.strip == 'y'
puts "Okay... nice knowin ya"

load_t_start = Time.now
doc = REXML::Document.new( open("mus_musculus_esearch.xml") )
load_t_end = Time.now

ids = [] 

xpath_t_start = Time.now
doc.elements.each("/eSearchResult/IdList/Id") {|n| ids << n.text}
xpath_t_end = Time.now


puts "XPath'd #{ids.length} nodes"
puts "Loading: #{load_time  = load_t_end - load_t_start} seconds",
     "XPath:   #{xpath_time = xpath_t_end - xpath_t_start} seconds",
     "Total:   #{load_time + xpath_time}"