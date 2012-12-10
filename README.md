# RailsAdminMongoLoc

Adds to [RailsAdmin](https://github.com/sferik/rails_admin) support for [mongoid localized fields](http://mongoid.org/en/mongoid/docs/documents.html#localized_fields). Based on gem ["localized_fields"](https://github.com/tiagogodinho/localized_fields)


## Installation

In your `Gemfile`add the following dependencies:

    gem 'rails_admin_mongo_loc', :git => 'git://github.com/infernalmaster/rails_admin_mongo_loc'

Run:

    $ bundle install

## Usage

Gem creates two new field types for RailsAdmin: 
* **textml** — localized analog of native text (https://github.com/sferik/rails_admin/wiki/Text)
* **stringml** — localized analog of native string (https://github.com/sferik/rails_admin/wiki/String)

*This fields accept all cofigurations as their native analogs* 

###Fields - overring field type
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

If no configuration needs to take place the configuration block could have been left out:

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