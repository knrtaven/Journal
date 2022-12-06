class Task < ApplicationRecord
    belongs_to :category
    
    validates :name, presence: true, 
                     length: { minimum: 5 }
    validates :description, presence: true,
                     length: {minimum: 5 }
    validate :is_due_date_valid
   
    def due_format
        due.strftime("%b %d, %T%p")
    end

    def self.today
        Task.where(:due => Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    end
    

    private

    def is_due_date_valid
        return if due.blank?
        if due < Time.now 
            errors.add(:due, 'date cannot be previous date')
        end
    end    
end
