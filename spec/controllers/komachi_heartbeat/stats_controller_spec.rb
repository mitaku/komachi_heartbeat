RSpec.describe KomachiHeartbeat::StatsController, type: :controller do
  describe 'GET worker' do
    context 'Sidekiq' do
      it 'returns full Sidekiq::Stats attributes', :skip => RUBY_VERSION < '2.0.0' do
        require 'sidekiq/api'
        get :worker
        expect(JSON.parse(response.body)).to include(
          'processed', 'failed', 'scheduled_size', 'retry_size', 'dead_size',
          'processes_size', 'default_queue_latency', 'workers_size', 'enqueued'
        )
      end
    end
  end
end
