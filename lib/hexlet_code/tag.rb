module HexletCode
  class Tag
    def self.build(name, **attributes)
      body = yield if block_given?

      formatted_attributes = attributes.each_with_object([]) do |(name, content), acc|
        acc.push("#{name}=\"#{content}\"")
      end

      tag = [name, *formatted_attributes].join(' ')

      body ? "<#{tag}>#{body}</#{name}>" : "<#{tag}>"
    end
  end
end