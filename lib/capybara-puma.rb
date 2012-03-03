require 'capybara'
require 'puma'

module CapybaraPuma
  def self.activate
    Capybara.server do |app, port|
      Puma::Server.new(app).tap do |s|
        s.add_tcp_listener '127.0.0.1', port
      end.run.join
    end
  end
end
CapybaraPuma.activate
