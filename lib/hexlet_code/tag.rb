# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Tag
    def self.build(name, **attributes)
      body = yield if block_given?

      formatted_attributes = attributes.each_with_object([]) do |(attribute, content), acc|
        if content.nil?
          acc.push(attribute.to_s)
        else
          acc.push("#{attribute}=\"#{content}\"")
        end
      end

      tag = [name, *formatted_attributes].join(' ')

      body ? "<#{tag}>#{body}</#{name}>" : "<#{tag}>"
    end
  end
end
