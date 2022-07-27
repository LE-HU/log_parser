#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'config/environment'

Parser::Main.new(options: Interface.new.options).parse
