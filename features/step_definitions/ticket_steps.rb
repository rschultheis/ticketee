And /"([^"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    state = attributes.delete("state")
    attributes.merge!(:user => User.find_by_email!(email))
    ticket = @project.tickets.create!(attributes)
    ticket.state = State.find_or_create_by_name(state) if state
    ticket.tag!(tags) if tags
    ticket.save
  end
end
