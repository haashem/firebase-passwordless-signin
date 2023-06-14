Feature: Passwordless signin
    # As a user
    # I want to sign in to the app without using a password
    # So that I can have a secure and convenient authentication experience
    After:
        Then clean up
        
    Scenario: Successful sign-in using a sign-in link
        Given App launches with valid signin link
        And A loading indicator is displayed
        When Signin verification completes Successfully
        Then I should sign in automatically
        And I should see home page

    Scenario: Failure sign-in using an invalid sign-in link
        Given App launches with invalid signin link
        When Signin verification completes with failure
        Then I should see an error message {"Couldn't sign in with the link"}
        And I dissmiss the alert
        And I should see email page

