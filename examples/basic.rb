require "../lib/beid_parser"
require "pp"

file = ARGV.first
if file.nil?
  puts "You must specify the filename as first argument" 
  exit
end

beid = BeidParser::Beid.new(file)
pp beid

beid.extract_picture
