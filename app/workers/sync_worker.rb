class SyncWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #This method is responsible of synchronize of 5 in 5 min the API
  recurrence { minutely(5) } 

  def perform
    # Call worker sync api
    SynchronizeApiWorker.perform_async
  end
end
