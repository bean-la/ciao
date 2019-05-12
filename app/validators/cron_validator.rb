class CronValidator < ActiveModel::EachValidator

    def self.compliant?(value)
      cron = ::Fugit::Cron.parse(value)
      !cron.nil?    
    rescue StandardError => e
      p e
    end
    
    def validate_each(record, attribute, value)
      unless value.present? && self.class.compliant?(value)
        record.errors.add(attribute, "is not a valid cron. Check https://crontab.guru/ and come back again")
      end
    end
    
  end