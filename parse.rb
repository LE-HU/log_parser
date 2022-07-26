#!/usr/bin/env ruby

require_relative 'lib/parser'

Parser.new(options: Interface.new.options).parse
