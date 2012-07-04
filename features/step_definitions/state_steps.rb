Given /^there is a state called "([^"]*)"$/ do |name|
  State.create!(:name => name)
end

And /^I follow "(.*?)" for the "(.*?)" state$/ do |link, name|
  state = State.find_by_name!(name)
  steps(%Q{When I follow "#{link}" within "#state_#{state.id}"})
end
