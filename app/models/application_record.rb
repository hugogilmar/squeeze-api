# frozen_string_literal: true

# Record base class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
