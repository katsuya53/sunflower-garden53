class FlowersController < ApplicationController

  def index
      # デフォルト値として今日の日付を設定
      @selected_date = params[:selected_date] || Date.today
      @flower = Flower.find_by(date: @selected_date)
  end

  def import
    if params[:file].present?
      Flower.import_from_csv(params[:file])
      redirect_to root_url, notice: "CSV ファイルが正常にインポートされました"
    else
      redirect_to root_url, alert: "CSV ファイルが選択されていません"
    end
  end
end