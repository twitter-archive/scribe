
require 'rubygems'
require 'thrift_client'

HERE = File.expand_path(File.dirname(__FILE__))

$LOAD_PATH << "#{HERE}/../vendor/gen-rb"
require "#{HERE}/../vendor/gen-rb/scribe"

$LOAD_PATH << "#{HERE}"
require 'scribe/scribe'
require 'scribe/debug' if ENV['DEBUG']
