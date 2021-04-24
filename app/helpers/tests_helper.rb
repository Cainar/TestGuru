module TestsHelper
  BACKGROUND_STYLES = {
    1 => 'info',
    2 => 'warning',
    3 => 'danger'
  }.freeze

  def level_bg(test)
    BACKGROUND_STYLES[test.level]
  end
end
