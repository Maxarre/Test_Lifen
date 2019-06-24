require 'json'

data = 'data.json'
lecture = File.read(data)
hash_lecture = JSON.parse(lecture, symbolize_names: true)

xp_delivery = []
totals = []

pract = hash_lecture[:practitioners]
comms = hash_lecture[:communications]

pract.each do |practitioner|
  if practitioner[:express_delivery]
    xp_delivery << practitioner[:id]
  end
end

comms_group = comms.group_by do |com|
  com[:sent_at].split.first.to_s
end
comms_group.each do |day, communications|
  price = communications.map do |communication|
    comms_price = 0.1
    comms_price += (communication[:pages_number] - 1) * 0.07
    if communication[:color]
      comms_price += 0.18
    end
    if xp_delivery.include? communication[:practitioner_id]
      comms_price += 0.6
    end
    comms_price.to_f
  end
  totals.push(sent_on: day, total: price.sum.round(2))
end

new_output = { totals: totals }

File.open('new_output.json', 'wb') do |output|
  output.write(JSON.pretty_generate(new_output))
end
