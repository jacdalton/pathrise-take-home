# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'csv'

# Destroy existing records to start with clean slate each time seed file needs to be run
puts 'Destroying all job opportunities...'
JobOpportunity.destroy_all
puts 'Job opportunities destroyed successfully!'

filepath = 'job_opportunities.csv'
first_row = true

puts 'Looping through CSV data to generate models...'
CSV.foreach(filepath) do |row|
  # This is to skip the headers
  if first_row
    first_row = false
    next
  else
    # Create a new JobOpportunity in the database
    JobOpportunity.create(
      id: row[0],
      job_title: row[1],
      company_name: row[2],
      job_url: row[3]
      # TODO: Implement resolver to add job_source (don't seed yet!)
      # job_source: Resolver
    )
    puts "Job opportunity #{row[0]} created"
  end
end

puts 'All job opportunities successfully created!'