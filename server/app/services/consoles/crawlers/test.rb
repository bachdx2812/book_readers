module Consoles
  module Crawlers
    class Test
      include Interactor

      def call
        init_driver

        context.session = Capybara::Session.new(:chrome)
        context.url = "https://www.fahasa.com/hieu-ve-trai-tim-tai-ban-2023.html"

        context.session.visit(context.url)
        infos_div = context.session.find("#product_view_info")

        binding.pry
      end

      private

      def init_driver
        Capybara.register_driver :chrome do |app|
          Capybara::Selenium::Driver.new(app, browser: :chrome)
        end

        Capybara.register_driver :headless_chrome do |app|
          capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
            chromeOptions: {
              args: %w[headless enable-features=NetworkService,NetworkServiceInProcess],
            },
          )

          Capybara::Selenium::Driver.new app,
                                         browser: :chrome,
                                         desired_capabilities: capabilities
        end

        Capybara.default_driver = :chrome
        Capybara.javascript_driver = :chrome
      end
    end
  end
end
