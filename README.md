# Snapogram

Snapogram is the latest phenomenon in social photo-sharing apps.  Show off your photography with the hippest filters (cool, warm and neutral). Share photos from either a desktop browser or a mobile browser &mdash; whatever you fancy.

![Mobile screenshot 1](/docs/Screenshot_20160815-161835.png) * ![Mobile screenshot 2](/docs/Screenshot_20160815-161907.png)

### Getting Started

#### Prerequisites
- [homebrew](http://brew.sh/)
- [ruby](https://www.ruby-lang.org/en/)

#### Installation
1. Install and configure postgresql:

	`brew install postgresql`
	```
	ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
	launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
	```

1. Create the necessary databases

	`psql postgres`
	```
	create database snapogram_development;
	create database snapogram_test;
	\q
	```

1. Run `bundle install` to install other dependencies
1. Migrate the database with `bin/rails db:migrate RAILS_ENV=development`

#### Server
Start the server with `bin/rails s`

#### Testing
Run tests with `rspec`
