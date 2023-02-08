namespace :config do
  desc "TODO"
  task count: :environment do
    Subject.find_each do |subject|
      Subject.reset_counters(subject.id, :questions)
    end
  end

end
