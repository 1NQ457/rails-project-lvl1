# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'
require 'hexlet_code/form'

module HexletCode
  class Error < StandardError; end

  class << self
    def form_for(model, route = '#')
      form = HexletCode::Form.new model
      yield(form) if block_given?
      form.build route
    end
  end
end
