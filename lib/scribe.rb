
require 'rubygems'
require 'thrift'

HERE = File.expand_path(File.dirname(__FILE__))

$LOAD_PATH << "#{HERE}/../vendor/gen-rb"
require "#{HERE}/../vendor/gen-rb/scribe"

Object.const_set("ScribeThrift", Scribe)
Object.send(:remove_const, "Scribe")

ScribeThrift.const_set("LogEntry", LogEntry)
Object.send(:remove_const, "LogEntry")

$LOAD_PATH << "#{HERE}"
require 'scribe/scribe'
require 'scribe/debug' if ENV['DEBUG']
