class MatchesController < ApplicationController
  before_action :set_match, only: %i[ destroy ]

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to matches_path, notice: "Match was successfully created.", status: :see_other }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @match.destroy!

    respond_to do |format|
      format.html { redirect_to matches_path, notice: "Match was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_match
      @match = Match.find(params.expect(:id))
    end

    def match_params
      params.require(:match).permit(:winner_id, :loser_id, :match_date)
    end
end
