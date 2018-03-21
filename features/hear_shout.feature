Feature: Hear Shout

  Shouts have a range of approximately 1000m

  Background:
    Given Lucy is at 0, 0

  Scenario Outline: In range shout is heard
    When Sean is at <seans_location>
    And Sean shouts
    Then Lucy should hear <what_lucy_hears>

    Examples:
      | seans_location | what_lucy_hears |
      | 0, 900         | Sean            |
      | 800, 800       | nothing         |

  Scenario: Multiple shouters
    Given people are located at
      | name  | x     | y    |
      | Sean  | 0     | 500  |
      | Oscar | 1100  | 0    |
    When Sean shouts
    And Oscar shouts
    Then Lucy should not hear Oscar
    But Lucy should hear Sean

  @wip
  Scenario: Shouters should not hear their own shouts
    When Lucy shouts
    Then Lucy should not hear Lucy

  Scenario: Multiple shouts from one person
    When Sean is at 0, 500
    And Sean shouts
    And Sean shouts
    Then Lucy should hear 2 shouts from Sean


