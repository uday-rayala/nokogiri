#! /usr/bin/ruby

$: << File.join(File.dirname(__FILE__), '..', '..', 'lib')
require 'nokogiri'
require 'rubygems'
require 'xml'
require 'benchmark'

file = File.join(File.dirname(__FILE__), "mus_musculus_esearch.xml")

["nokogiri", "libxml-ruby"].each do |library|
  doc = (library == "nokogiri") ? Nokogiri::XML(open(file)) \
                                : XML::Document.file(file)
  ids = [] 

  Benchmark.bm(25) do |bm|
    3.times do
      begin
        set = nil
        bm.report("#{library} search") {
          set = (library == "nokogiri") ? doc.xpath("/eSearchResult/IdList/Id") \
                                        : doc.find("/eSearchResult/IdList/Id")
        }
        bm.report("#{library} iterating") {
          set.each {|n| ids << n.content}
        }
        set = nil
      end
      GC.start
    end
    puts "XPath'd #{ids.length} nodes"
  end
end
