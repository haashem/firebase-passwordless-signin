Feature: Passwordless signin
    # As a user
    # I want to sign in to the app without using a password
    # So that I can have a secure and convenient authentication experience

    Scenario: User signs-in with valid link 
        Given App launches with valid signin link
        And A loading indicator is displayed
        When Signin verification completes Successfully
        Then I should sign in automatically
        And I should see home page
        