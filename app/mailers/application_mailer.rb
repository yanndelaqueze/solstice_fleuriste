class ApplicationMailer < ActionMailer::Base
  default from: ENV["OVH_EMAIL"]
  layout "mailer"
end
