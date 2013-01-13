# Birdses

Birdses implements views for [gollum](https://github.com/github/gollum) as a mountable rails engine.

Add Birdses to your rails application in three easy steps:

1. add `gem 'birdses'` to your Gemfile and run `bundle install`
2. add `mount Birdses::Engine => "/wiki"` to your `config/routes.rb`
3. init a [git](http://git-scm.com/) repository under `wiki/`  
   (you can do this by running `rake init_wiki`)

## Caveats

### `current_user`

If you're using an authentication system that provides a `current_user` method (like [devise](https://github.com/plataformatec/devise)), birdses will try to access `.fullname` and `.email` (on current_user). It will use these for the commit messages.

### `_url`/`_path`

If you use any magic url mappers (anything that ends with `_path` or `_url`) in the application layout you will have to use the `main_app` [helper](http://edgeguides.rubyonrails.org/engines.html#using-a-class-provided-by-the-application).

For example, I use [Twitter Bootstrap](http://twitter.github.com/bootstrap/) and have a 'Sign Out' link in my navigation bar. For it to work properly with birdses I have to prepend the helper method. 

without birdes:
```haml
# ...
- if current_user
  %li= link_to('Sign Out', destroy_user_session_path, method: :delete)
# ...
```

with birdses:
```haml
# ...
- if current_user
  %li= link_to('Sign Out', main_app.destroy_user_session_path, method: :delete)
# ...
```

Otherwise you will get errors like this, when accessing the mounted wiki:

```
NameError in Birdses/pages#index

Showing /Users/max/code/snap_app/app/views/layouts/application.html.haml where line #43 raised:

undefined local variable or method `destroy_user_session_path' for
#<#<Class:0x007fd67c3d6418>:0x007fd67afb3508>
```
