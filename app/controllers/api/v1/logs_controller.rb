module Api
	module V1
		class LogsController < ApplicationController
			skip_before_filter :verify_authenticity_token


			def initialize
				@logs = LogService.new
			end

			def index
				render json: {status: 'SUCCESS', message: 'Logs carregados', data: @logs.getAll}, status: :ok

			end

			def show
				begin
					log = @logs.getById(params[:id])
					render json: {status: 'SUCCESS', message: 'Log carregado', data: log}, status: :ok
				rescue
					render json: {status: 'FAILED', message: 'Log nao encontrado', data: nil}, status: :not_found
				end
			end

			def create
				log = Log.new(log_params)

				if log.save
					render json: {status: 'SUCCESS', message: 'Log salvo', data: log}, status: :ok
				else
					render json: {status: 'FAILED', message: 'Log nao salvo', data: log}, status: :unprocessable_entity
				end
			end

			def getByContext
				logs_in_context = @logs.getByContext(params[:context])
				render json: {status: 'SUCCESS', message: 'Logs carregados', data: logs_in_context}, status: :ok
			end

			private

			def log_params
				params.permit(:day, :hour, :minutes, :log_type, :context, :log_message)
			end
		end
	end
end