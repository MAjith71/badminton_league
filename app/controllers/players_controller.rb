class PlayersController < ApplicationController
  before_action :set_player, only: %i[ destroy ]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to players_path, notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player.destroy!

    respond_to do |format|
      format.html { redirect_to players_path, notice: "Player was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_player
      @player = Player.find(params.expect(:id))
    end

    def player_params
      params.require(:player).permit(:name)
    end
end
