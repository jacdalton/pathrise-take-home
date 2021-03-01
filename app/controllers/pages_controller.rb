require 'json'
class PagesController < ApplicationController
  def index
    file = File.open "jobBoards.json"
    data = JSON.load file
    @job_boards = data["job_boards"]
  end
end