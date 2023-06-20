import '../shared/sample_data.dart';

Feature: Request signin link
    
    Scenario: Not signed-in user is directed to the email page
        Given I launch the app
        And I'm not signed in
        Then I see email page

    Scenario: On system failure to send sign in link, an error alert should be shown
        Given I'm on the email page
        And I enter {validEmail} in the email field
        When I tap the {'Sign in'} button
        And I see loading indicator
        And system fails to sent email link
        Then I should see an error alert
        And Loading indicator hides
