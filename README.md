# Endleaf
Routing and utilities for static pages creation in Rails.

## Installation
Add this line to your Rails application's Gemfile:

```ruby
gem "endleaf"
```

## Usage
- Use with Ruby on Rails only.
- Add routes to `config/routes.rb`

```ruby
scope module: 'endleaf' do
  get '/pages/:page', to: 'pages#show', as: :page
end
```
- Create pages in `app/views/pages` with filenames corresponding to their routes.

```ruby
# can be used in specific routes e.g. homepage
# this route is rendered from app/view/pages/home.html.erb (or any supported extensions)
root 'endleaf/pages#show' , page: 'home'

# this route is rendered from app/view/pages/about.html.erb (or any supported extensions)
get  'endleaf/pages#show' , page: 'about'
```

- Pre-render pages into the `public` directory. Pre-rendered pages can be served by a web server and are more cache-friendly.

```shell
bundle exec rake endleaf:render:generate_html
```


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
