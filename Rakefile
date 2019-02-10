task default: :hello


desc "hello dayo!"
task :hello do
  puts "Hello!! lets select task!!"
  sh "rake -T"
end

desc "execute selenium-chromium and log cheapest price of beterugift to sqlite3"
task :exec, [:option] do |t, args|
  if args[:option] == "jit"
    sh "env RUBYOPT='--jit' bundle exec ruby exec_browse.rb"
  else
    sh "bundle exec ruby exec_browse.rb"
  end
end
