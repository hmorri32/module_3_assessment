task :delete_cassettes => :environment do
  cassettes = (Dir['spec/vcr/*/*.yml'].map { |d| File.expand_path(d) } )
  cassettes.each { |v| File.delete(v) }
end