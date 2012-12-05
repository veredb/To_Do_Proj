def path_to(page_name)
  case page_name
  when /^the home\s?page$/
    '/'
  when "that blog post's page"
    post_path(@post)
  else
    raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
      "Now, go and add a mapping in #{__FILE__}"
  end
end

# When I go to someplace # page_name => someplace
When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Given /^user "(.*?)" has a task with title "(.*?)", due date "(.*?)", and priority "(.*?)"$/ do |email, title, due_date, priority|
  user = User.where("email=?", email).first
  user.tasks.create(:title => title, :Due_date => due_date, :Priority => priority)
end

Given /^a user with email address "(.*?)"$/ do |email|
  User.create!(:email => email, :name => email.split('@').first)
end
