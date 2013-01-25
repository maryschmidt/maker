class TestHarness
  include Capybara::DSL
  include Features::SessionHelpers
  include FactoryGirl::Syntax::Methods
  include Rails.application.routes.url_helpers
end
