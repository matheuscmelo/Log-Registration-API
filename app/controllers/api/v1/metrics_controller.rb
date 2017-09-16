module Api
	module V1
		class MetricsController < ApplicationController

			def initialize
				@logs = LogService.new
			end

			def logsPerHour
				context = params[:context]
				logs = @logs.getByContext(context)

				average = logs.length / 24.0

				average = average * 10
				average = average.ceil
				average = average / 10.0

				render json: {status: 'SUCCESS', message: 'Media calculada', data: average}, status: :ok

			end

			def hourWithMostLogs

				# usando um passo do count sort para calcular a frequencia porque sim

				context = params[:context]
				logs = @logs.getByContext(context)
				count = [0] * 24

				for log in logs
					count[log.hour] += 1
				end

				hour_with_most_logs = 0

				for i in [*0..count.length-1]
					if count[i] > count[hour_with_most_logs]
						hour_with_most_logs = i
					end
				end

				render json: {status: 'SUCCESS', message: 'Hora com maior numero de logs calculada', data: hour_with_most_logs}, status: :ok
			end

			def hourWithLeastLogs

				# mesma coisa que o outro só muda a condicao. template method?

				context = params[:context]
				logs = @logs.getByContext(context)
				count = [0] * 24

				for log in logs
					count[log.hour] += 1
				end

				hour_with_most_logs = 0

				for i in [*0..count.length-1]
					if count[i] < count[hour_with_most_logs]
						hour_with_most_logs = i
					end
				end

				render json: {status: 'SUCCESS', message: 'Hora com menor numero de logs calculada', data: hour_with_most_logs}, status: :ok
			end
		end
	end
end