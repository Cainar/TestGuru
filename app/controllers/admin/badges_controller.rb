class Admin::BadgesController < Admin::BaseController
  before_action :set_badges
  #before_action :set_badge
  before_action :set_files
  before_action :set_rules

  def index
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(new_badge_params)

    if @badge.save 
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @badge.update(new_test_params) 
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_files
    @files = Dir.entries(Rails.root + 'app/assets/images').select {|f| f =~ /\.svg$/}
  end

  def set_rules
    @rules = Rule.constants
  end

  def new_badge_params
    params.require(:badge).permit(:name, :file)
  end
end
