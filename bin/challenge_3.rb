require 'yaml'
require 'pp'

data = YAML.load(File.read('../data/amusement_parks.yml'))



def index_by(locations, &block)
  result = {}
  locations.each do |location|
    result[block.call(location)] ||= []
    result[block.call(location)] << location
  end
  pp result
  result
end

index_by(data){|hsh| "#{hsh[:state]}, #{hsh[:country]}" }

# require 'rspec/autorun'
#
# RSpec.describe '#index_by' do
#
#
#   it 'returns a hash where the values are arrays of travel locations, grouped by the given key' do
#     input = [
#       {
#         :id=>3,
#         :name=>"Galaxyland",
#         :city=>"Edmonton",
#         :state=>"Alberta",
#         :country=>"Canada"
#       },
#       {
#         :id=>4,
#         :name=>"Heratage Park",
#         :city=>"Calgary",
#         :state=>"Alberta",
#         :country=>"Canada"
#       },
#       {
#         :id=>6,
#         :name=>"Playland (Vancouver)",
#         :city=>"Vancouver",
#         :state=>"British Columbia",
#         :country=>"Canada"
#       },
#       {
#         :id=>8,
#         :name=>"Crystal Palace Amusement Park",
#         :city=>"Dieppe",
#         :state=>"New Brunswick",
#         :country=>"Canada"
#       }
#     ]
#
#     expect(index_by(input) {|hsh| "#{hsh[:state]}, #{hsh[:country]}" }).to eq({
#       "Alberta, Canada" => [
#         {
#           :id => 3,
#           :name => "Galaxyland",
#           :city => "Edmonton",
#           :state => "Alberta",
#           :country => "Canada"
#         },
#         {
#           :id => 4,
#           :name => "Heratage Park",
#           :city => "Calgary",
#           :state => "Alberta",
#           :country => "Canada"
#         },
#       ],
#       "British Columbia, Canada" => [
#         {
#           :id => 6,
#           :name => "Playland (Vancouver)",
#           :city => "Vancouver",
#           :state => "British Columbia",
#           :country => "Canada"
#         },
#       ],
#       "New Brunswick, Canada" => [
#         {
#           :id => 8,
#           :name => "Crystal Palace Amusement Park",
#           :city => "Dieppe",
#           :state => "New Brunswick",
#           :country => "Canada"
#         }
#       ]
#       })
#     end
# end
