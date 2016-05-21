require 'rails_helper'

describe SynchronizeApiWorker do
  it { is_expected.to be_processed_in :default }
  
  it "enqueues a symchronize api worker" do
    expect {
		  SynchronizeApiWorker.perform_async
		}.to change(SynchronizeApiWorker.jobs, :size).by(1)
  end
end