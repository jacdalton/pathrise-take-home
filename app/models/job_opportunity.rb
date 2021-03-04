class JobOpportunity < ApplicationRecord
  # Don't have a need to include the timestamp columns & they clutter up display so exclude them for now
  # self.ignored_columns = %w[created_at updated_at]
end
