#Process flow factory
Factory.define :process_flow do |process_flow|
  process_flow.name "Example process flow"
  process_flow.description "This is the description of the process flow"
end

Factory.define :process_unit do |process_unit|
  process_unit.name "Example process unit"
  process_unit.description "This is the description of the process unit"
  process_unit.association :process_flow
end