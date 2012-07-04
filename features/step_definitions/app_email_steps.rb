And /^the email should contain (\d+) parts$/ do |num|
  current_email.parts.size.should eql(num.to_i)
end


And /^there should be a part with content type "(.*?)"$/ do |content_type|
  current_email.parts.detect do |p|
    p.content_type.starts_with? content_type
  end.should_not be_nil
end
