# Deprecated

> Please use [chrome_testing_downloader](https://github.com/SonicGarden/chrome_testing_downloader) instead.

PuppeteerHelper

A helper to use chromium in system spec.

## Required

- node
- puppeteer >= 20.0.0

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'puppeteer_helper', github: 'SonicGarden/puppeteer_helper'
end
```

And then execute:

```
$ bundle install
$ yarn add -D puppeteer
```

## Usage

First you need to require puppeteer_helper in your spec_helper.rb:

```ruby
require 'puppeteer_helper/rspec'
```
