set :job_template, nil
every 1.day, :at => '4:30 am' do
  command "backup perform --quiet -t file_backup,mysql_backup -c config.rb"
end