module Tallyit
  module DeleteTally
    def self.do(file, lineno)
      File.open(file + '.tmp', 'w') do |tmp_file|
        File.open(file, 'r') do |file|
          file.each_with_index do |line, index|
            next if index + 1 == lineno
            tmp_file.puts line
          end
        end
      end
      `mv #{file + '.tmp'} #{file}`
    end
  end
end

