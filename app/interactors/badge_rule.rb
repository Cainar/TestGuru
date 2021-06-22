class BadgeRule
  include Interactor

  MULTIPLY = false 
  @@result ||= {}

  def self.set_result(value)
    @@result[self] = value
  end

  def self.result
    @@result
  end
end
