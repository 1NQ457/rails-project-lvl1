# frozen_string_literal: true

module HexletCode
  autoload :Version, 'hexlet_code/version'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :Label, 'hexlet_code/tags/label'
  autoload :Input, 'hexlet_code/tags/input'
  autoload :Textarea, 'hexlet_code/tags/textarea'
  autoload :Select, 'hexlet_code/tags/select/select'
  autoload :Option, 'hexlet_code/tags/select/option'
  autoload :Submit, 'hexlet_code/tags/submit'

  class << self
    def form_for(model, route = '#')
      form = Form.new model
      yield(form) if block_given?
      FormBuilder.build form, route
    end
  end
end
