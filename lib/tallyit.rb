require "tallyit/add_tally"
require "tallyit/delete_tally"
require "tallyit/stat_tally"
require "tallyit/version"

module Tallyit
  def self.add(tally, file)
    Tallyit::AddTally.do(tally, file)
  end

  def self.delete(file, lineno)
    Tallyit::DeleteTally.do(file, lineno.to_i)
  end

  def self.stat(file, format)
    Tallyit::StatTally.do(file, format.to_sym)
  end
end
