Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			get 'logs/:id' => 'logs#show'
			get 'logs/' => 'logs#index'
			post 'logs/' => 'logs#create'
			get 'context/:context' => 'logs#getByContext'
			get 'context/:context/metrics/averagePerHour/' => 'metrics#logsPerHour'
			get 'context/:context/metrics/hourWithMostLogs/' => 'metrics#hourWithMostLogs'
			get 'context/:context/metrics/hourWithLeastLogs/' => 'metrics#hourWithLeastLogs'
		end
	end

#   namespace 'api' do
#   	namespace 'v1' do
#   		resources :logs, :context
#   	end
#   end
end
