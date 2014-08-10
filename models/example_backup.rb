Model.new(:file_backup, 'Backups all files and configurations') do
  archive :apache_and_web do |archive|
    archive.add '/etc/apache2/apache2.conf'    
    archive.add '/etc/apache2/conf.d'
    archive.add '/etc/apache2/conf-enabled'
    archive.add '/etc/apache2/sites-enabled'
    archive.add '/etc/apache2/sites-available'
    archive.add '/var/www/'
  end
  
  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = "~/backups/"
    local.keep       = 5
  end

  ##
  # Bzip2 [Compressor]
  # tar xvjf filename.tar.bz2
  #
  compress_with Bzip2
  
  notify_by Mail do |mail|
    mail.on_success = true
    mail.on_warning = true
    mail.on_failure = true
  end
end

Model.new(:mysql_backup, 'Backups all MySQL databases on example.com') do

  ##
  # MySQL [Database]
  #
  database MySQL, :example_db do |db|
    db.name               = ""
    db.username           = ""
    db.password           = ""
    db.host               = "localhost"
    db.port               = 3306
  end
  
  database MySQL, :example_db2 do |db|
    db.name               = ""
    db.username           = ""
    db.password           = ""
    db.host               = "localhost"
    db.port               = 3306
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = "~/backups/"
    local.keep       = 5
  end

  ##
  # Bzip2 [Compressor]
  # bzip2 -d filename.bz2
  #
  compress_with Bzip2
  
  notify_by Mail do |mail|
    mail.on_success = true
    mail.on_warning = true
    mail.on_failure = true
  end
end
