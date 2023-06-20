Feature: Request signin link
    
    Scenario: Not signed-in user is directed to the email page
        Given I launch the app
        And I'm not signed in
        Then I see email page
