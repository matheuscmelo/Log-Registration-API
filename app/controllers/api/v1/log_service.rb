module Api
	module V1

		class LogService

			def getById(id)
				return Log.find(id)
			end

			def getAll
				return Log.all
			end

			def getByContext(context)
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