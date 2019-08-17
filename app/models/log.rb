class Log < ApplicationRecord
  belongs_to :user
  has_many :workouts, through: :log_workouts

  def new
    @log = Log.new
  end

  def create
    @workout = Log.create(log_params)
  end

  def edit
    @
  end

  def update

  end

  def destroy

  end

  private
end
