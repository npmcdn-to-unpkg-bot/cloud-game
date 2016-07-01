class GamesController < ApplicationController

  def index
  end

  def show
    vpgu_start_command = "vgpu start #{current_user.id} #{params[:id]}"
    # if system.("vgpu start", current_user.id, params[:id])
    #   redirect_to action: :index, notice: '仮想マシンの起動に成功しました！！'
    # else
    #   redirect_to action: :index, notice: '仮想マシンの起動に失敗しました'
    # end
    begin
      system.(vpgu_start_command)
      redirect_to action: :index, success: '仮想マシンの起動に成功しました！！'
    rescue
      redirect_to action: :index, danger: '仮想マシンの起動に失敗しました'
    end
  end

end
