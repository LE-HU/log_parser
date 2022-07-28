# Log Parser

Parser capable of pretty printing data from `<path> <ip>` log files.

## Prerequisites

Application requires `ruby` language interpreter.

Built using ruby 3.1.2.

## Usage

Invoke CLI help:
`./bin/parse`

```bash
  Usage: parse.rb [options]
    -f, --file FILE                  Specify log file
                                     Lists all views by default
    -u, --uniq                       List unique views
```

additionaly one can use `-h` or `--help` for help prompt.
When no flags are passed, the program falls back to treat the first CLI argument as a filename.

### Example call
Root directory contains example `webserver.log` log file.

```bash
  ruby parse.rb -f webserver.log -u

  List of webpages with most unique views:
  1. /help_page/1 ....23 unique views
  2. /contact ........23 unique views
  3. /home ...........23 unique views
  4. /index ..........23 unique views
  5. /about/2 ........22 unique views
  6. /about ..........21 unique views
```

## Development
App includes couple gems inside `Gemfile` to help with development.

### Run tests

In order to run RSpec tests one needs to execute:

*RubyGems + bundler gem required*
```bash
  bundle
```
to install dependencies, and
```bash
  rspec .
```
to run the test suite.
