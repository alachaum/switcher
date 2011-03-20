#Process flow factory
Factory.define :process_flow do |process_flow|
  process_flow.name "Example process flow"
  process_flow.description "This is the description of the process flow"
end

Factory.sequence :p_flow_name do |n|
  "Process Flow \##{n}"
end

#Process unit factory
Factory.define :process_unit do |process_unit|
  process_unit.name "Example process unit"
  process_unit.description "This is the description of the process unit"
  process_unit.association :process_flow
end

Factory.sequence :p_unit_name do |n|
  "Process Unit \##{n}"
end

#Process element factory
Factory.define :process_element do |process_element|
  process_element.name "Example process element"
  process_element.description "This is the description of the process element"
  process_element.role "ElementRole"
  process_element.association :process_unit
end