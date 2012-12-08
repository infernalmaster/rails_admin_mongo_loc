# RailsAdminMongoLoc

Adds to [RailsAdmin](https://github.com/sferik/rails_admin) support for [mongoid localized fields](http://mongoid.org/en/mongoid/docs/documents.html#localized_fields). Based on gem ["localized_fields"](https://github.com/tiagogodinho/localized_fields)

## Important

You should overwrite [edit.rb](https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/edit.rb) from RailsAdmin with same file where commented one line:
```ruby
#sanitize_params_for!(request.xhr? ? :modal : :update)
```
Just put [that](https://github.com/infernalmaster/rails_admin_mongo_loc/blob/master/lib/edit.rb) file in your project lib/rails_admin and enable it with this row in config/aplication.rb:

	config.autoload_paths += %W(#{config.root}/lib)

## Installation

In your `Gemfile`add the following dependencies:

    gem 'rails_admin_mongo_loc', :git => 'git://github.com/infernalmaster/rails_admin_mongo_loc'

Run:

    $ bundle install


## Usage

Add to your model attr_accessible for **your_localized_fields** and also for **your_localized_fields**_translations. For example:

```ruby
	attr_accessible :title, :title_translations, :description, :description_translations,
```

Gem creates two new field types for RailsAdmin: 
* **textml** — localized analog of native text (https://github.com/sferik/rails_admin/wiki/Text)
* **stringml** — localized analog of native string (https://github.com/sferik/rails_admin/wiki/String) 

###Fields - overriding field type
(more is there https://github.com/sferik/rails_admin/wiki/Railsadmin-DSL)

Fast start.
If you would like to configure fields in the default group without changing the other
fields already included in the default group, you can use the `configure` block like this:

```ruby
RailsAdmin.config do |config|
  config.model Team do
    edit do
      configure :description, :stringml do
        # configuration here
      end
    end
  end
end
```

If no configuration needs to take place the configuration block could have been
left out:

```ruby
RailsAdmin.config do |config|
  config.model Team do
    edit do
      field :description, :stringml
    end
  end
end
```


This project rocks and uses MIT-LICENSE.