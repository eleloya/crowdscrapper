#!/usr/bin/env ruby
# encoding utf-8
require_relative 'lib/common'

def usage
  puts <<-EOF
usage: ./crowdscrapper.rb URL
--csv [optional] 

examples: 
./crowdscrapper.rb https://www.kickstarter.com/projects/180695797/enter-the-cave
./crowdscrapper.rb https://fondeadora.mx/projects/grande-cortometraje
EOF
  exit 1
end


url = ARGV[0]
usage if url.nil?

csv = ARGV[1]

if url.include? "fondeadora"
  scrap = FondeadoraProject.new(url)
else
  scrap = KickStarterProject.new(url)
end

if csv
  scrap.description_csv 
else
  scrap.description
end