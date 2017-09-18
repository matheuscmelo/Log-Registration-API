module Api
	module V1
		class LogsController < ApplicationController
			skip_before_filter :verify_authenticity_token


			def initialize
				@logs = LogService.new
			end

			def index
				render json: Response.new('SUCCESS', 'Logs carregados', @logs.getAll), status: :ok

			end

			def show
				begin
					log = @logs.get_by_id(params[:id])
					render json: Response.new('SUCCESS', 'Log carregado', log), status: :ok
				rescue
					render json: Response.new('FAILED', 'Log nao encontrado', nil), status: :not_found
				end
			end

			def create
				log = Log.new(log_params)

				if log.save
					render json: Response.new('SUCCESS', 'Log salvo', log), status: :ok
				else
					render json: Response.new('FAILED', 'Log nao salvo', log), status: :unprocessable_entity
				end
			end

			def get_by_context
				logs_in_context = @logs.get_by_context(params[:context])
				render json: Response.new('SUCCESS', 'Logs carregados', logs_in_context), status: :ok
			end

			private

			def log_params
				params.permit(:day, :hour, :minutes, :log_type, :context, :log_message)
			end
		end
	end
end