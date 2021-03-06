# frozen_string_literal: true

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end
# activate :directory_indexes

require 'sprockets/es6'
activate :sprockets do |s|
  s.expose_middleman_helpers = true
  s.supported_output_extensions << '.es6'
end
activate :livereload

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  # activate :minify_javascript
  activate :minify_html, remove_input_attributes: false
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
  activate :favicon_maker, icons: {
    '_favicon_template.png' => [
      { icon: 'apple-touch-icon-180x180-precomposed.png' },
      { icon: 'apple-touch-icon-152x152-precomposed.png' },
      { icon: 'apple-touch-icon-144x144-precomposed.png' },
      { icon: 'apple-touch-icon-120x120-precomposed.png' },
      { icon: 'apple-touch-icon-114x114-precomposed.png' },
      { icon: 'apple-touch-icon-76x76-precomposed.png' },
      { icon: 'apple-touch-icon-72x72-precomposed.png' },
      { icon: 'apple-touch-icon-60x60-precomposed.png' },
      { icon: 'apple-touch-icon-57x57-precomposed.png' },
      { icon: 'apple-touch-icon-precomposed.png', size: '57x57' },
      { icon: 'apple-touch-icon.png', size: '57x57' },
      { icon: 'favicon-196x196.png' },
      { icon: 'favicon-160x160.png' },
      { icon: 'favicon-96x96.png' },
      { icon: 'favicon-32x32.png' },
      { icon: 'favicon-16x16.png' },
      { icon: 'favicon.png', size: '16x16' },
      { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
      { icon: 'mstile-70x70.png', size: '70x70' },
      { icon: 'mstile-144x144.png', size: '144x144' },
      { icon: 'mstile-150x150.png', size: '150x150' },
      { icon: 'mstile-310x310.png', size: '310x310' },
      { icon: 'mstile-310x150.png', size: '310x150' }
    ]
  }
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.branch       = 'gh-pages'
  deploy.deploy_method = :git
end
