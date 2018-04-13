class Appointment < ApplicationRecord
  belongs_to :simulation
  belongs_to :hour
end
