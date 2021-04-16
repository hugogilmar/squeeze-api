# frozen_string_literal: true

SimpleCov.start('rails') do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/test/'
  add_group 'Commands', 'app/commands'
  add_group 'Forms', 'app/forms'
  add_group 'Serializers', 'app/serializers'
end
