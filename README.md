# Team Dashboard Plugins

Data Source Plugins for [Team Dashboard](https://github.com/fdietz/team_dashboard)

## Use Plugins in your Team Dashboard

Download the individual ruby file directly in the corresponding directory of your RAILS_ROOT/app/sources.

For example:

    number/hockey_app.rb -> RAILS_ROOT/app/sources/number/hockey_app.rb.

After a page refresh (no restart required) the new source plugin should be automatically available.

Note, that some plugins require either Gemfile or configuration changes. Check out the documentation provided in the ruby file directly.

## Contribute
Did you implement your own data source plugin and think they might be useful to others, too? Fork this project and send me a pull request, please!