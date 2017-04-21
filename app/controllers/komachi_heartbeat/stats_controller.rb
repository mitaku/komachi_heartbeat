require_dependency "komachi_heartbeat/application_controller"

module KomachiHeartbeat
  class StatsController < ApplicationController
    def worker
      return head :not_found unless worker_stats_enabled?
      render json: worker_stats
    end

    private

    def worker_stats
      if defined?(Sidekiq)
        sidekiq_stats
      elsif defined?(Resque)
        resque_stats
      end
    end

    def sidekiq_stats
      JSON.parse(Sidekiq::Stats.new.to_json)['stats']
    end

    def resque_stats
      unless Resque.respond_to?(:pending_queues)
        Resque.class_eval {
          def pending_queues
            queues.inject(0) { |m,k| m + size(k) }
          end
        }
      end
      { enqueued: Resque.pending_queues, processed: Resque::Stat[:processed]}
    end

    def worker_stats_enabled?
      KomachiHeartbeat.config.worker_stats_enabled
    end
  end
end
