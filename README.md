# Phone number support for Rails

Simple handling for phone numbers in rails apps. Make the aggressive
assumption that a valid phone number is a 10 digit number. Users can
input numbers in any format so long as they contain exactly 10 numeric
digits.

Phone numbers will be stripped of all non-numberic characters before
being saved, so your database contains just normalized numbers.

Valid numbers include "1231231234", "123-123-1234", and "(123) 123 1234".

## Installation

Add this line to your application's Gemfile:

    gem 'rails_phone'

Or install it yourself as:

    $ gem install rails_phone

## Usage

Add `has_phone_number`:

    class Person
      has_phone_number
    end

This will assume an attribute `:phone` exists. If you'd like to set it
up on a custom set of attributes just pass them in:

    class Person
      has_phone_number :cell, :mobile
    end

## Development

Uses a test rails app:

    cd test/dummy
    rake db:migrate
    rake db:test:prepare

    rake test  (from project dir)
