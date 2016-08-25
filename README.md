# So Meta

So Meta is a gem to simply manage meta content (title, description, canonical url, etc.) from within a Rails application

## Installation

Add this line to your application's Gemfile:

    gem 'so_meta'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install so_meta

## Usage

So Meta uses the localization file to provide easy to modify SEO text content for page titles, descriptions and other text content for layouts and views.

```YAML
# config/locales/en.yml

en:
  so_meta:
    defaults:
      title: "My Awesome New Rails Application"
      description: "This application will be so viral, your startup
      friends will be JEALOUS!"

    pages: # Controller name - PagesController
      about: # Action name - about
        title: "About | My Awesome New Rails Application"
        description: "Our company will blow your mind...like really."

    pages_subresource: # Controller name - Pages::SubresourceController
      about: # Action name - about
        title: "About | My Awesome New Rails Application"
        description: "Our company will blow your mind...like really."

    contact:
      title: "Contact %{name} | My Awesome New Rails Application" # Interpolation content from the view
      # By not specifying a description for this page, it'll inherit the defaults
```

```Erb
<!-- views/layouts/application.html.erb -->

<!DOCTYPE html>
<html lang="en">
  <head>
    <title><%= so_meta(:title) %></title>
    <meta name="description" content="<%= so_meta(:description) %>" />
    <%= csrf_meta_tags %>
  </head>
  <body>
  </body>
</html>
```

```Erb
<!-- app/views/pages/contact.html.erb -->

<% so_meta_interpolation :title, name: "Brandon" %>

<h1>Contact</h1>
<p>Contact us now!</p>
```

### Usage with scoping

```Erb
<title><%= so_meta(:title, :phone) %></title>
```

```YAML
# config/locales/en.yml

en:
  so_meta:
    defaults:
      title: "My Awesome New Rails Application"
      description: "This application will be so viral, your startup
      friends will be JEALOUS!"

    pages: # Controller name - PagesController
      about: # Action name - about
        title: "About | My Awesome New Rails Application"
        description: "Our company will blow your mind...like really."

        phone:
          title: "Specific title for phone" # will choose this if the scope
          matches
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
