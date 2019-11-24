# frozen_string_literal: true

module Squeeze
  module V1
    module Users
      # Users update form
      class UpdateForm < Reform::Form
        property :profile,
                 form: Profiles::UpdateForm,
                 populator: lambda { |model:, **|
                              model || self.profile = Profile.new
                            }

        validates :profile, presence: true
      end
    end
  end
end
