And /^user "([^"]*)" has created a ticket for this project:$/ do |email, table|
  user = User.find_by_email!(email)
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes.merge!(:user => user))
  end
end
