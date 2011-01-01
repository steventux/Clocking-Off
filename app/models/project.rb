class Project < ActiveRecord::Base
  belongs_to :client

  validates_presence_of :name
  validates_numericality_of :client_id

end
