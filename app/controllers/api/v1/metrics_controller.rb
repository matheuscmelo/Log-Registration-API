module Api
	module V1
		class MetricsController < ApplicationController

			def initialize
				@logs = LogService.new
			end

			def logs_per_hour
				context = params[:context]
				logs = @logs.get_by_context(context)

				average = logs.length / 24.0

				# adequando a 1 casa decimal

				average = average * 10
				average = average.ceil
				average = average / 10.0

				Response.new('SUCCESS', 'Media calculada', average)
				render json: Response.new('SUCCESS', 'Media calculada', average), status: :ok

			end

			def hour_with_most_logs

				# usando um passo do count sort para calcular a frequencia porque sim

				context = params[:context]
				logs = @logs.get_by_context(context)

				frequency = day_frequency(logs)

				hour_with_most_logs = get_most_frequency(frequency)

				render json: Response.new('SUCCESS', 'Hora com maior numero de logs calculada', hour_with_most_logs), status: :ok
			end

			def hour_with_least_logs

				# mesma coisa que o outro só muda a condicao. template method?

				context = params[:context]
				logs = @logs.get_by_context(context)
				
				frequency = day_frequency(logs)

				hour_with_least_logs = get_least_frequency(frequency)

				render json: Response.new('SUCCESS', 'Hora com menor numero de logs calculada', hour_with_least_logs), status: :ok
			end

			private

			def day_frequency(logs)
				count = [0] * 24

				for log in logs
					count[log.hour] += 1
				end

				return count
			end

			def get_least_frequency(list)
				least = 0
				for i in [*0..list.length-1]
					if list[i] < list[least]
						least = i
					end
				end

				return least
			end

			def get_most_frequency(list)
				least = 0
				for i in [*0..list.length-1]
					if list[i] > list[least]
						least = i
					end
				end

				return least
			end




		end
	end
end