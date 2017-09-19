Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			get 'logs/:id' => 'logs#show'
			get 'logs/' => 'logs#index'
			post 'logs/' => 'logs#create'
			get 'context/:context' => 'logs#get_by_context'
			get 'context/:context/metrics/averagePerHour/' => 'metrics#logs_per_hour'
			get 'context/:context/metrics/hourWithMostLogs/' => 'metrics#hour_with_most_logs'
			get 'context/:context/metrics/hourWithLeastLogs/' => 'metrics#hour_with_least_logs'
			get 'context/:context/metrics/logsToday/' => 'logs#logs_today'
			get 'hour/:hour' => 'logs#logs_in_hour'
		end
	end

#   namespace 'api' do
#   	namespace 'v1' do
#   		resources :logs, :context
#   	end
#   end
end
