module Api
	module V1
		class MetricsController < ApplicationController

			def logsPerHour
				logs = Log.all
				total_today = 0
				current_date = Time.now.strftime("%Y-%m-%d")
				current_hour = Integer(Time.now.strftime("%H"))

				for log in logs
					if current_date == log.day
						total_today += 1
					end
				end

				average = total_today / current_hour

				render json: {status: 'SUCCESS', message: 'Media calculada', data: total_today}, status: :ok

			end

			def mostLogsInHour

				# usando um passo do count sort para calcular a frequencia, eu paguei EDA pra alguma coisa afinal

				logs = Log.all
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

			def leastLogsInHour

				# mesma coisa que o outro só muda a condicao. template method?

				logs = Log.all
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