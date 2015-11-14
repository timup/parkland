# Parkland
[![License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)][license]
[![Dependency Status](http://img.shields.io/gemnasium/vaporware/parkland.svg?style=flat)][gemnasium]
[![Build Status](https://img.shields.io/circleci/project/vaporware/parkland.svg?style=flat)][circleci]
[![Code Coverage](http://img.shields.io/coveralls/vaporware/parkland.svg?style=flat)][coveralls]
[![Code Quality](http://img.shields.io/codeclimate/github/vaporware/parkland.svg?style=flat)][codeclimate]

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

It is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production

[circleci]: https://circleci.com/gh/vaporware/parkland
[coveralls]: https://coveralls.io/r/vaporware/parkland
[gemnasium]: https://gemnasium.com/vaporware/parkland
[codeclimate]: https://codeclimate.com/github/vaporware/parkland
[license]: https://github.com/vaporware/parkland/blob/master/LICENSE.md
[contributors]: https://github.com/vaporware/parkland/graphs/contributors
