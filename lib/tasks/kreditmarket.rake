require 'ansi/code'

default_color = :blue

namespace :setup do
  desc "Generate token for older requests"
  task :tokens => :environment do
    puts ANSI.color(default_color) { "Genarting tokens for silly requests" }
    Request.all.each do |request|
      unless request.token.present?
        request.update_attribute(:token, Digest::SHA1.hexdigest([Time.now, rand].join))
      end
    end
  end
end
