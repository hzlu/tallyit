require 'terminal-table'

module Tallyit
  module StatTally
    def self.do(file, format = :table)
      if format == :table
        income_amount = []
        expend_amount = []
        table = Terminal::Table.new do |t|
          t.title = "Balance Table"
          t.headings = ['ID', 'Type', 'Amount', 'Msg', 'Time']
          File.open(file, 'r') do |file|
            file.each_with_index do |line, index|
              tmp = line.chomp.split(' | ')
              tmp[0] == 'income' ? income_amount << tmp[1].to_f : expend_amount << tmp[1].to_f
              t << tmp.unshift(index + 1)
            end
          end
          income_total = income_amount.reduce(0, :+)
          expend_total = expend_amount.reduce(0, :+)
          t << :separator
          t << ['Income total', income_total]
          t << :separator
          t << ['Expend total', expend_total]
          t << :separator
          t << ['Remaining', income_total - expend_total]
        end
        puts table
      elsif format == :raw
        File.open(file, 'r') do |file|
          file.each_line do |line|
            puts line
          end
        end
      end
    end
  end
end
