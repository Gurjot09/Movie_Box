set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 1.minute do
	 rake "mail:send_digest_email"	
end