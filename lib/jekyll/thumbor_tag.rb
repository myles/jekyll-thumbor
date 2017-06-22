require "liquid"
require "ruby-thumbor"

module Jekyll
  module ThumborTag
    class ThumborTag < Liquid::Tag

      def initialize(tag_name, text, tokens)
        super

        tokens = text.split /\,\s/
        @url = tokens[0]
        @parameters = {}

        tokens[1..-1].each do |arg|
          k, v = arg.split /:/
          v ||= "1"
          @parameters[k.strip] = v.strip
        end
      end

      def render(context)
        @config = context.registers[:site].config['thumbor']

        image = Thumbor::Cascade.new(@config['key'], @url)
        image_url = image.width(@parameters['width']).height(@parameters['height']).generate

        "#{@config['url']}#{image_url}"
      end
    end
  end
end

Liquid::Template.register_tag('thumbor', Jekyll::ThumborTag::ThumborTag)
