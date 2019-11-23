require('reform/form/validation/unique_validator')

module Squeeze
  module V1
    module Users
      class CreateForm < Reform::Form
        property :email
        property :password
        property :password_confirmation, virtual: true
        property :profile, form: Profiles::CreateForm, populator: -> (model:, **) do
          model || self.profile = Profile.new
        end

        validates :email, presence: true, unique: true
        validates :password, presence: true, confirmation: true
        validates :password_confirmation, presence: true
        validates :profile, presence: true
      end
    end
  end
end
