require "sunspot/queue"

module Sunspot::Queue
  module ActiveJob
    require "sunspot/queue/activejob/backend"
    require "sunspot/queue/activejob/index_job"
    require "sunspot/queue/activejob/removal_job"
  end
end
