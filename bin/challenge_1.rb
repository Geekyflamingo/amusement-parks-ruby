require 'yaml'
require 'pp'

data = YAML.load(File.read('../data/amusement_parks.yml'))



def index_by(locations, &block)
  result = {}
  locations.each do |location|
    result[block.call(location)] ||= {}
    result[block.call(location)] = location
  end
  pp result
  result
end

index_by(data){|hsh| hsh[:id] }

require 'rspec/autorun'

# RSpec.describe '#index_by' do
#
#   it 'returns a hash where the values are arrays of travel locations, grouped by the given key' do
#     input = [
#       {
#         :id=>546,
#         :name=>"Kalahari Resorts",
#         :city=>"Wisconsin Dells",
#         :state=>"Wisconsin",
#         :country=>"United States"
#       },
#       {
#         :id=>547,
#         :name=>"Little Amerricka",
#         :city=>"Marshall",
#         :state=>"Wisconsin",
#         :country=>"United States"
#       }
#     ]
#
#     expect(index_by(input) {|hsh| hsh[:id] }).to eq({
#       546 => {
#         :id=>546,
#         :name=>"Kalahari Resorts",
#         :city=>"Wisconsin Dells",
#         :state=>"Wisconsin",
#         :country=>"United States"
#       },
#       547 => {
#         :id=>547,
#         :name=>"Little Amerricka",
#         :city=>"Marshall",
#         :state=>"Wisconsin",
#         :country=>"United States"
#       }
#       })
#     end
#   end
