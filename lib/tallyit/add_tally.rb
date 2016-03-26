module Tallyit
  module AddTally
    def self.do(tally, file)
      File.open(file, 'a') do |file|
        file.puts "#{tally.type} | #{tally.amount} | #{tally.msg} | #{Time.now}"
      end
    end
  end
end
