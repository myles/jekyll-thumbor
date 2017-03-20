require "jekyll/thumbor/version"

require "liquid"
require "ruby-thumbor"

module Jekyll
  module ThumborFilter
  end
end

Liquid::Template.register_filter(Jekyll::ThumborFilter)
