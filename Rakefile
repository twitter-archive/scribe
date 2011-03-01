
begin
  require 'rubygems'
  require 'echoe'

  Echoe.new("scribe") do |p|
    p.author = "Evan Weaver"
    p.project = "fauna"
    p.summary = "A Ruby client for the Scribe distributed log server."
    p.rubygems_version = ">= 0.8"
    p.dependencies = ['thrift_client ~>0.6', 'rake']
    p.ignore_pattern = /^(vendor\/thrift)/
    p.rdoc_pattern = /^(lib|bin|tasks|ext)|^README|^CHANGELOG|^TODO|^LICENSE|^COPYING$/
  end
rescue LoadError
end

desc "Start Scribe"
task :scribe do
  system("mkdir /tmp/scribetest/") unless File.exist?("/tmp/scribetest/")
  system("scribed -c #{File.expand_path(File.dirname(__FILE__))}/conf/scribe.conf &")
end

desc "Stop Scribe"
task :stop do
  system("killall scribed")
end

desc "Restart Scribe"
task :restart => ["stop", "scribe"] do
end

# desc "Regenerate thrift bindings for Scribe" # Dev only
task :thrift do
  puts "Generating Thrift bindings"
  # FIXME
end
