require 'csv'
require 'fileutils'
require 'date'

namespace :payments do
  desc 'import payments from CSV file'
  task :import, [:file_path] => :environment do |_t, args|
    file_path = args.fetch(:file_path)

    raise "File #{file_path} does not exist" unless File.exist? file_path

    File.open(file_path) do |file|
      CSV.foreach(file) do |row|
        payment = Payment.new
        payment.id = row[0]
        payment.contact_id = row[1]
        payment.advanced_amount = row[2]
        payment.payment_date = row[3] ? Date.strptime(row[3], "%m/%d/%y") : nil
        payment.deducted_from_bl = row[4]
        payment.amount_deducted = row[5]
        payment.total_rebate = row[6]
        payment.save!
      rescue StandardError => e
        puts "Row #{row[0]} could not be processed. Error: #{e}"
      end
    end
  end
end
