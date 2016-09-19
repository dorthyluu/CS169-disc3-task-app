Feature: Make a task urgent
    As a ToDo App user
    So that I can prioritize what needs to get done first
    I want to be able to mark a task as urgent
    
Scenario: Making a task urgent
  Given I see the form to create tasks
  And I create the following tasks: "Do CS169 hw", "Give your TA a high five"
  When I make the task "Do CS169 hw" as urgent 
  Then I should see the task "Do CS169 hw" under "#urgent_tasks"
  And I should see the task "Give your TA a high five" under "#non_urgent_tasks"