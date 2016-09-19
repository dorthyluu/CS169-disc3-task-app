Feature: Complete a task
  As a ToDo App user
  So that I can know when I've completed all my tasks
  I want to be able to mark a task as completed
  
Scenario: Completing a task
  Given I see the form to create tasks
  And I create the following tasks: "Make dinner", "Go for a run"
  When I complete the task "Make dinner"
  Then I should see the task "Make dinner" under "#completed_tasks"
  And I should see the task "Go for a run" under "#non_completed_tasks"
  