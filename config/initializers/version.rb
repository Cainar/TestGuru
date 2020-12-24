# the version of my app
module App_version
  def version
	attr_reader :version
	@version = '0.1.0'
  end
end
