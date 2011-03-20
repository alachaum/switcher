require 'faker'

namespace :db do
  desc "Fill the database with sample process flows and units"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_process_flows
    make_process_units
    make_process_elements
  end
end

#Add sample process flows to the database
def make_process_flows
  message = "Add sample process flows"
  monitor(message) do
    10.times do |n|
      name = "Process Flow #{n}"
      description = Faker::Lorem.sentence(10)
      ProcessFlow.create!(:name => name,
                          :description => description)
    end
  end
end

#Add sample process units to the database
def make_process_units
  message = "Add sample process units"
  monitor(message) do
    ProcessFlow.all.each do |p_flow|
      5.times do |n|
        name = "Unit #{n+1}"
        description = "This unit belongs to #{p_flow.name}"
        p_flow.process_units.create!(:name => name,
                                     :description => description)
      end 
    end
  end
end

def make_process_elements
  message = "Add sample process elements"
  monitor(message) do
    ProcessUnit.all.each do |p_unit|
      ["condition","action","monitor","validation"].each do |role|
        p_unit.process_elements.create!(:name => role.capitalize,
                                        :description => "#{role.capitalize} for #{p_unit.name}",
                                        :role => role)
      end
    end
  end
end

# Display a message and the execution time 
# on the console for a function
def monitor(message)
  puts "-- #{message}"
  start = Time.now
  yield
  puts "   -> #{Time.now - start}s"
end