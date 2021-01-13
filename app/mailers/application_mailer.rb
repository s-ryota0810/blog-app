# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com' #自動メールの送信元を指す
  layout 'mailer' #テンプレートを指定
end
