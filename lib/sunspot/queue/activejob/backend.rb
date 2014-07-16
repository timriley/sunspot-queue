require "sunspot/queue/activejob/index_job"
require "sunspot/queue/activejob/removal_job"

module Sunspot::Queue::ActiveJob
  class Backend
    attr_reader :configuration

    def initialize(configuration = Sunspot::Queue.configuration)
      @configuration = configuration
    end

    def index(klass, id)
      index_job.enqueue klass, id
    end

    def remove(klass, id)
      removal_job.enqueue klass, id
    end

    private

    def index_job
      configuration.index_job || ::Sunspot::Queue::ActiveJob::IndexJob
    end

    def removal_job
      configuration.removal_job || ::Sunspot::Queue::ActiveJob::RemovalJob
    end
  end
end
