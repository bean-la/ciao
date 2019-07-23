namespace :ciao do
  task recreate_jobs: :environment do
    Check.active.each do |check|
      check.unschedule_job if check.job
      check.create_job
    end
    Rails.logger.info "ciao-scheduler Database conn. pool stat: #{ActiveRecord::Base.connection_pool.stat}"
  end
end