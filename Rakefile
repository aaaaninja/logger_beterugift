require "sqlite3"
#require "parser????"


task default: :hello


desc "hello dayo!"
task :hello do
  puts "Hello!! lets select task!!"
  sh "rake -T"
end

desc "execute selenium-chromium and log cheapest price of beterugift to sqlite3"
task :exec, [:option] do |t, args|
  SQLite3::Database.new("Transition_beterugift.db").execute("CREATE TABLE gift_prices (id integer primary key, face_value integer, selling_price integer, discount_rate real, recording_date text)") unless File.exist?("Transition_beterugift.db")

  if args[:option] == "jit"
    sh "env RUBYOPT='--jit' bundle exec ruby exec_browse.rb"
  else
    sh "bundle exec ruby exec_browse.rb"
  end
end
