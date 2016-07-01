class GamesController < ApplicationController
  after_action :redirect_to_main_view, only: :show

  def index
  end

  def show
    vpgu_start_command = "vgpu start 1 #{params[:id]}"
    # if system.("vgpu start", current_user.id, params[:id])
    #   redirect_to action: :index, notice: '仮想マシンの起動に成功しました！！'
    # else
    #   redirect_to action: :index, notice: '仮想マシンの起動に失敗しました'
    # end
    begin
      result = `#{vpgu_start_command}`
      # system(vpgu_start_command)
      redirect_to result, success: "仮想マシンの起動に成功しました！！#{result}"
    rescue
      redirect_to action: :index, danger: '仮想マシンの起動に失敗しました'
    end
  end

  private
  def redirect_to_main_view
    redirect_to "http://157.82.3.170:3000/done.html"
  end

end
