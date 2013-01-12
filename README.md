# Birdses


## Caveats

If you use any of magic url mappers (anything that ends with `_path` or `_url`) in the application layout you will have to use the `main_app` [helper](http://edgeguides.rubyonrails.org/engines.html#using-a-class-provided-by-the-application).

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
