class Log < ApplicationRecord
	validates :day, presence: true
	validates :hour, presence: true
	validates :minutes, presence: true
	validates :context, presence: true
	validates :log_message, presence: true
	validates :log_type, presence: true
end
