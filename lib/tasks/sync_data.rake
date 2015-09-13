namespace :data do 
  desc "sync data with DB"
  task sync_data: [:environment] do
    LoadDataJob.run
  end
end