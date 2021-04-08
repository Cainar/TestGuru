class ApplicationMailer < ActionMailer::Base
  default from: %{"TestsGuru" <mail@testguru.com>}
  layout 'mailer'
end
