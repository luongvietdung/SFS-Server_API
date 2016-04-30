namespace :db do
  desc "Recreate database"
  task recreate: :environment do
    list_tasks = case
    when Rails.env.development?
      begin
        Rake::Task["db:drop"].invoke
      rescue Exception => e
        puts e
      end
      %w[db:create db:migrate db:seed db:test:prepare]
    else
      Array.new
    end
    if list_tasks.any?
      list_tasks.each do |task|
        puts "\e[36mEXECUTE #{task} COMMAND\e[0m"
        Rake::Task[task].invoke
      end
    else
      puts "\e[31mdb:recreate task can be executed only in the development environment.\e[0m"
    end
  end
end
