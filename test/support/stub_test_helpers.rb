# frozen_string_literal: true

module StubTesttHelpers
  def stub_any_instance(klass, method, value)
    klass.class_eval do
      alias_method :"new_#{method}", method

      define_method(method) do
        if value.respond_to?(:call)
          value.call
        else
          value
        end
      end
    end

    yield
  ensure
    klass.class_eval do
      undef_method method
      alias_method method, :"new_#{method}"
      undef_method :"new_#{method}"
    end
  end
end
