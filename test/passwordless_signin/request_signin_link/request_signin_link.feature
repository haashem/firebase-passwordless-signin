import '../shared/sample_data.dart';

Feature: Request signin link
    
    After:
        Then clean up

    Scenario: Not signed-in user is directed to the email page
        Given I launch the app
        And I'm not signed in
        Then I see email page

    Scenario: Email should be validated
        Given I'm on the email page
        When I enter {'invalidEmail'} in the email field
        And I tap the {'Sign in'} button
        Then I should see invalid email error message

    Scenario: On system failure to send sign in link, error alert should be shown
        Given I'm on the email page
        And I enter {validEmail} in the email field
        When I tap the {'Sign in'} button
        And I see loading indicator
        And system fails to sent email link
        Then I should see an error alert
        And Loading indicator hides

    Scenario: On system failure to send sign in link, user shoule be able to retry
        Given I'm on the email page
        And I enter {validEmail} in the email field
        When I tap the {'Sign in'} button
        And system fails to sent email link
        Then I should be able to retry
        
    Scenario: On send sign-in link success, user should see email sent page
        Given I'm on the email page
        And I enter {validEmail} in the email field
        When I tap the {'Sign in'} button
        And The system successfully sends the email link
        Then I should navigate to the email sent page
