###
# Page options, layouts, aliases and proxies
###
# Per-page layout changes:
#

require 'rack'
::Rack::Mime::MIME_TYPES[''] = 'text/html'

# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :directory_indexes

activate :robots,
  :rules => [
    {:user_agent => '*', :Disallow => %w(/)}
  ],
  :sitemap => "https://animeoutreach.org/sitemap.xml"

activate :blog do |blog|
  blog.prefix = "blog"
  blog.name = "blog"
  blog.layout = "blog_layout"
  blog.sources = "posts/{year}-{month}-{day}-{title}"
  blog.default_extension = ".md"

  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"


  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

activate :blog do |blog|
  blog.prefix = "page"
  blog.name = "page"
  blog.layout = "layout"
  blog.sources = "pages/{title}"
  blog.permalink = "{title}.html"
  blog.default_extension = ".md"
end

activate :blog do |blog|
  blog.prefix = "member"
  blog.name = "member"
  blog.layout = "layout"
  blog.sources = "members/{title}"
  blog.permalink = "{title}.html"
  blog.default_extension = ".md"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
