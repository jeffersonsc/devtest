require 'rails_helper'

describe SyncWorker do
  it { is_expected.to be_processed_in :default }
  
  it "enqueues a sync api worker" do
    expect {
		  SyncWorker.perform_async
		}.to change(SyncWorker.jobs, :size).by(1)
  end
end