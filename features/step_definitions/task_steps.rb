Given /^I see the form to create tasks$/ do
    visit '/'
end

When /^I create the following tasks: (.*)$/ do |tasks|
    tasks = tasks.split(', ')
    tasks.each do |task|
        task.gsub!('"', '')
        fill_in("task_description", with: task)
        click_button("Create Task")
    end
end

When /^I complete the task "(.*)"$/ do |task|
    click_on(task)
    check("task_completed")
    click_button("Update Task")
end

When /^I should see the task "(.*)" under "(.*)"$/ do |task, id|
    within(id) do
        assert page.has_content?(task)
    end
end