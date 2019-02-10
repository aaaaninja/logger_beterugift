task default: :hello


desc "hello dayo!"
task :hello do
  puts "Hello!! lets select task!!"
  sh "rake -T"
end

desc "execute selenium-chromium and log cheapest price of beterugift to sqlite3"
task :exec do
  sh "bundle exec ruby exec_browse.rb"
end

desc "mostly equal :exec task, but with --jit option"
task :exec_with_jit do
  sh "env RUBYOPT='--jit' bundle exec ruby exec_browse.rb"
end
