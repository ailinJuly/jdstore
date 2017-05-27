class Appointment < ApplicationRecord

    scope :recent, ->{ order('created_at DESC')  }
        validates :name, presence: true
        validates :phone, presence: true
end
