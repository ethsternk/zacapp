require 'csv'
require 'fileutils'

namespace :contacts do
  desc 'import contacts from CSV file'
  task :import, [:file_path, :first_id] => :environment do |_t, args|
    file_path = args.fetch(:file_path)
    first_id = args.fetch(:first_id).to_i

    raise "File #{file_path} does not exist" unless File.exist? file_path

    File.open(file_path) do |file|
      CSV.foreach(file) do |row|
        contact = Contact.new
        id = row[0].to_i
        contact.id = id == 0 ? first_id : id
        contact.first_name = row[1]
        contact.last_name = row[2]
        contact.address = row[3]
        contact.city = row[4]
        contact.state_or_province = row[5]
        contact.postal_code = row[6]
        contact.home_phone = row[7]
        contact.mobile_phone = row[8]
        contact.notes = row[9]
        contact.paid_in_full = row[10]
        contact.email = row[11]
        contact.save!
      rescue StandardError => e
        puts "Row #{row[0]} could not be processed. Error: #{e}"
      end
    end
  end
end
