class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def search
    @players = Player.search(params[:query])
  end

  def show
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.json { render :show, status: :created, location: @player }
      else
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @player.update(player_params)
        format.json { render :show, status: :ok, location: @player }
      else
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :email, :street, :city, :postal_code)
  end
end
