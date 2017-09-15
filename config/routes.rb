Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			get 'logs/:id' => 'logs#show'
			get 'logs/' => 'logs#index'
			post 'logs/' => 'logs#create'
			get 'context/:context' => 'logs#getByContext'
			get 'metrics/averagePerHour' => 'metrics#logsPerHour'
			get 'metrics/mostLogsInHour' => 'metrics#mostLogsInHour'
			get 'metrics/leastLogsInHour' => 'metrics#leastLogsInHour'
		end
	end

#   namespace 'api' do
#   	namespace 'v1' do
#   		resources :logs, :context
#   	end
#   end
end
