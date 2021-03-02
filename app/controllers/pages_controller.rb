require 'json'
class PagesController < ApplicationController
  # Read the jobBoards.json file to get the current list of job boards & set it to a constant
  file = File.open "jobBoards.json"
  data = JSON.load file
  JOB_BOARDS = data["job_boards"]

  def index
    # Return the entire job boards object to the view
    @job_boards = JOB_BOARDS
  end

  def job_board
    # Map the job boards into a hash of the job board "pretty" name & matching route name
    job_boards = JOB_BOARDS.map { |jb| { name: jb["name"], route: jb["name"].downcase.gsub(/[[:space:]]+|[^a-zA-Z ]+/, "")} }
    # Select the job board name that matches the route from params (select always returns array, should only be 1 value in resulting array)
    name = job_boards.select { |jb| jb[:route] == params[:name] }.first
    @job_source = name[:name]
    # Send a "pretty" version of the column names to the view along with the list of job opportunities corresponding to the job board from params
    @headers = JobOpportunity.columns.map { |col| col.name.gsub(/_/, " ").titleize }
    @jb_opps = JobOpportunity.where(job_source: @job_source)
  end
end