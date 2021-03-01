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
    # Create instance of Resolver using jobBoards.json to add job_source to database
    resolver = Resolver.new("jobBoards.json")
    # Create a new JobOpportunity to pass to resolver
    job_opp = JobOpportunity.new(
      id: row[0],
      job_title: row[1],
      company_name: row[2],
      job_url: row[3]
    )
    # Set the job_source using the resolver
    job_opp.job_source = resolver.resolve_one(job_opp)
    # Save the instance
    job_opp.save!
    puts "Job opportunity #{row[0]} created"
  end
end

puts 'All job opportunities successfully created!'