Feature: Complete a task
  As a ToDo App user
  So that I can know when I'm finished with all my tasks
  I want to be able to mark a task as complete
  
Scenario: 
  Given I see the list of tasks
  And I create the following tasks: "Make dinner", "Go for a run"
  And I complete the task "Go for a run"
  Then I should see "Go for a run" under "#completed_tasks"
  And I should see "Make dinner" under "#non_completed_tasks"