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

		end

	end
end