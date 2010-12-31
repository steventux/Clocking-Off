require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  should validate_presence_of :name
  should validate_numericality_of :client_id

end
