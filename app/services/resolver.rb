require 'json'

class Resolver
  attr_accessor :data

  def initialize(filepath)
    file = File.open filepath
    @data = JSON.load file
  end

  def resolve_one(job)
    # job param should be instance of JobOpportunity & have company_name and job_url attributes
    # resolve_jb will be either job board name or nil
    resolve_jb = resolve_job_board(job.job_url)
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
end