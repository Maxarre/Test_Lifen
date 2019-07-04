# rake populate:init

namespace 'populate' do
  task init: :environment do
    first_practitioner = 1
    first_communication = 1
    total_practitioners = 300
    max_communications = 30

    first_practitioner.times do
      f_practitioner = Practitioner.create(first_name: 'Fritz', last_name: 'Kertzmann')
      puts [f_practitioner.first_name, f_practitioner.last_name].join(' ')

      first_communication.times do
        Communication.create(practitioner: f_practitioner, sent_at: '2019-01-01')
      end
    end

    total_practitioners.times do
      name = Faker::Name.name.split ' '
      practitioner = Practitioner.create(first_name: name.first, last_name: name.last)

      puts [practitioner.first_name, practitioner.last_name].join(' ')

      max_communications.times do
        p Communication.create(practitioner: practitioner, sent_at: Time.at(rand * Time.now.to_f))
      end
    end

    30_000.times do
      name = Faker::Name.name.split ' '
      practitioner = Practitioner.create(first_name: name.first, last_name: name.last)
    end
  end
end
