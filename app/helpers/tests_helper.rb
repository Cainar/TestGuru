module TestsHelper
  def level_bg(test)
    case test.level
      when 1
        "info"
      when 2
        "warning"
      when 3
        "danger"
      else
        "info"
    end
  end
end
