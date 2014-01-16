###
# Compass
###

# Susy grids in Compass
require 'susy'
require 'modular-scale'
require 'animate'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

# Live reload
activate :livereload

# Bloggin'
activate :blog do |blog|
    blog.prefix = "blog"
    blog.layout = "layouts/blog"
    blog.paginate = true
    blog.permalink = ":title.html"
    blog.tag_template = "tag.html"
    blog.calendar_template = "calendar.html"
    # blog.permalink = "{category}/{year}/{month}/{day}/{title}.html"
    # blog.summary_separator = READMORE
end

# Nice urls
activate :directory_indexes

# Code highlighting
activate :syntax

# Change the CSS directory
set :css_dir, "css"

# Change the JS directory
set :js_dir, "js"

# Change the images directory
set :images_dir, "img"

# Change the fonts directory
set :fonts_dir,  "fonts"

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Build-specific configuration
configure :build do

  # Requires middleman-favicon-maker
  # activate :favicon_maker,
  #   :favicon_maker_base_image => "favicon_base.svg"

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end