require 'json'

class Resolver
  attr_accessor :data

  def initialize(filepath)
    file = File.open filepath
    @data = JSON.load file
  end

  def resolve_one(job)
    # job param should be instance of JobOpportunity & have company_name and job_url attributes
    # Initialize job_source to unknown (should return this if other checks fail)
    job_source = "Unknown"
    # Only want to do the resolving checks if the url exists
    if !job.job_url.nil?
      # resolve_jb will be either job board name or nil
      resolve_jb = resolve_job_board(job.job_url)
      if resolve_jb.nil?
        # If resolve_jb is nil, no job board was found so we check for presence of company name in URL
        if resolve_company_website(job)
          # If company name is found in URL, set job source to Company Website
          job_source = "Company Website"
        end
      else
        # if resolve_jb is not nil, set job_source to the job board name
        job_source = resolve_jb
      end
    end

    return job_source
  end

  private

  def resolve_job_board(url)
    # Iterate over the job boards from the JSON file and check if the JobOpportunity instance's url contains the root domain & break if it does
    job_board = nil
    @data["job_boards"].each do |jb|
      if url.include? jb["root_domain"]
        job_board = jb["name"]
        break
      end
    end
    # job_board should either be a job board's name from the JSON file or nil if the root_domain was not found
    return job_board
  end

  def resolve_company_website(job)
    # [[:space:]] will account for whitespaces as well as &nbsp;
    return job.job_url.downcase.include? job.company_name.downcase.gsub(/[[:space:]]+/, "")
  end
end