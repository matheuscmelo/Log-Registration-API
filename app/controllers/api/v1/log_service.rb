module Api
	module V1

		class LogService

			def get_by_id(id)
				return Log.find(id)
			end

			def get_all
				return Log.all
			end

			def get_by_context(context)
				logs = Log.all
				logs_in_context = []

				for log in logs
					if log.context == context
						logs_in_context.push(log)
					end
				end

				return logs_in_context
			end

			def get_by_hour(hour)
				logs = Log.all
				logs_in_hour = []

				for log in logs
					if log.hour == Integer(hour)
						logs_in_hour.push(log)
					end
				end

				return logs_in_hour
			end

			def get_by_date(date)
				logs = Log.all
				logs_in_date = []

				for log in logs
					if log.day.strftime == date
						logs_in_date.push(log)
					end
				end


				return logs_in_date
			end

		end

	end
end