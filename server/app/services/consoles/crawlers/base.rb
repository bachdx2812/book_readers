module Consoles
  module Crawlers
    class Base
      include Interactor

      def call
        init_capybara
        init_driver_and_session
        crawl
      end

      private

      def init_capybara
        Capybara.register_driver :chrome do |app|
          Capybara::Selenium::Driver.new(app, browser: :chrome)
        end

        Capybara.register_driver :headless_chrome do |app|
          options = Selenium::WebDriver::Chrome::Options.new
          options.add_argument("--headless")
          options.add_argument("--enable-features=NetworkService,NetworkServiceInProcess")

          Capybara::Selenium::Driver.new(
            app,
            browser: :chrome,
            options: options,
          )
        end

        Capybara.default_driver = context.driver
        Capybara.javascript_driver = context.driver
      end

      def init_driver_and_session
        context.driver = ENV["CRAWLER_DEBUGGING"] ? :chrome : :headless_chrome
        context.session = Capybara::Session.new(context.driver)
      end

      def crawl
        raise NotImplementedError("Please Implement Crawl method")
      end
    end
  end
end
