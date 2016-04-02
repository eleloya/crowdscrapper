#!/usr/bin/env ruby
# encoding utf-8
require_relative 'lib/common'

def usage
  puts <<-EOF
usage: ./crowdscrapper.rb URL

examples: 
./crowdscrapper.rb https://www.kickstarter.com/projects/180695797/enter-the-cave
./crowdscrapper.rb https://fondeadora.mx/projects/grande-cortometraje
EOF
  exit 1
end


url = ARGV[0]
usage if url.nil?


doc = Nokogiri::HTML(open(url))

if url.include? "fondeadora"
  scrap = FondeadoraProject.new(doc)
else
  scrap = KickStarterProject.new(doc)
end

scrap.description