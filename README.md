# Pathrise Take Home Assignment
## Running the Code
### Prerequisites
* Ruby 3.0.0 should be installed (https://www.ruby-lang.org/en/downloads/)

### Cloning from GitHub
* Navigate to the directory you want the project to be in
* Clone the repository using your preferred method
  * Ex: run `git clone https://github.com/jacdalton/pathrise-take-home.git` in command line
* Don't forget to change directory into the newly cloned `pathrise-take-home` folder

### Setup
* Run `bundle install` command to get all necessary gem files
* Run `rails db:create db:migrate db:seed` to standup the PostgreSQL database with data provided in `job_opportunities.csv`

### Running the Server
* If default port of 3000 needs to change, it can be updated on line 18 in `config/puma.rb` before starting the server
* Finally, start the server using `rails s` in command line

## Third-party Libraries
* `react-rails` gem to incorporate React components with the Rails project
* Meyer web CSS reset to have a clean slate (http://meyerweb.com/eric/tools/css/reset/)

## Implementation Explanation
### Resolver
Resolver service is provided to resolve job sources based on given job opportunity information.
* Created as a service so that it is decoupled from model logic and is reusable
* `resolve_one` method expects object being passed will have job_url and company_name attributes (in context of this solution, object should be an instance of JobOpportunity)
* Expects to be initialized using a JSON file in the following format:
  ``` json
  {
    "job_boards": [
      {
        "name": "",
        "rating": "",
        "root_domain": "",
        "logo_file": "",
        "description": ""
      },
      ...
    ]
  }
  ```
* Example of its usage is in the `db/seeds.rb` file
* Implementation of a `resolve_one` method lends itself well to implementation of `resolve_many` method if needed at a future date
### Front End Interface
* Uses simple functional React components which can be modified to hold state if necessary through web hooks
* Because the components are currently stateless, they are utilized in `erb` files for the view to keep the controller simple
  * Through the `react-rails` gem it is possible to render components directly within the controller, this seemed unnecessary for the project constraints

## Publicly Accessible Interface
Please note that this is being hosted using a free plan on Heroku and, as such, may take some extra time on initial load for the dynos to "wake up."
* Link: jdalton-take-home.herokuapp.com

## Job Source Resolution CSV
Provided in the root folder as `job_opportunities_resolution.csv`

## Total Count of Job Opportunities by Source

Job Source | Count
-- | --
LinkedIn |  6606
Unknown |  3532
Greenhouse |  3040
Lever |  2670
Company Website |  2106
Indeed |  898
Jobvite |  382
Glassdoor |  298
Google |  160
AngelList |  120
SmartRecruiters |  69
ZipRecruiter |  66
Hired |  27
Triplebyte |  13
Monster |  4
Work At A Startup |  4
Government Jobs |  1
Stackoverflow |  2
Tech Ladies |  2
Dribble |  0
Wayup |  0
YCombinator Jobs |  0
Jopwell |  0
Intern Supply |  0
Underdog |  0
Stella |  0
SimplyHired |  0
Gamasutra |  0
Huntr Jobs |  0
Github |  0
Employbl |  0
Who Is Hiring? |  0     