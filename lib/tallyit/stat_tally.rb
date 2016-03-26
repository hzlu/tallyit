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
              if tmp[0] == 'income'
                income_amount << tmp[1].to_f
                tmp[1] = Rainbow(tmp[1]).green
              else
                expend_amount << tmp[1].to_f
                tmp[1] = Rainbow(tmp[1]).red
              end
              t << tmp.unshift(index + 1)
            end
          end
          income_total = income_amount.reduce(0, :+)
          expend_total = expend_amount.reduce(0, :+)
          t << :separator
          t << ['Income total', Rainbow(income_total).green]
          t << :separator
          t << ['Expend total', Rainbow(expend_total).red]
          t << :separator
          t << ['Remaining', Rainbow(income_total - expend_total).blue.inverse]
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
