module Api
	module V1

		class Response

			def initialize(status, message, data)
				@status = status
				@message = message
				@data = data
			end

		end

	end
end