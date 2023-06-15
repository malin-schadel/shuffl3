require "rest-client"
require "json"
require "open-uri"

bearer_token = ENV['BEARER_TOKEN']

response = RestClient.get(
  'https://drct3.manx.de/items/challenges',
  { :Authorization => "Bearer #{bearer_token}" }
)

JSON.parse(response)['data'].each do |card|
  new_card = Card.new(card)

  file = URI.open(
    "https://drct3.manx.de/assets/#{new_card.icon}?download",
    "Authorization" => "Bearer #{bearer_token}"
  )

  new_card.icon = file.meta["content-disposition"].match(/\w+.svg/)[0]
  new_card.save!
end
