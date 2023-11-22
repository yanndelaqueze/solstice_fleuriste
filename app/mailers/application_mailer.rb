class ApplicationMailer < ActionMailer::Base
  default from: "Laurie de Solstice <#{ENV["OVH_EMAIL"]}>"
  layout "mailer"
end
