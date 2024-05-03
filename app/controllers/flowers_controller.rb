class FlowersController < ApplicationController

  def index
      # デフォルト値として今日の日付を設定
      @selected_date = params[:selected_date] || Date.today
      @flower = Flower.find_by(date: @selected_date)
      # 指定した日付を取得して表示
      @selected_date = params[:selected_date].present? ? Date.parse(params[:selected_date]) : Date.today
      @flower = Flower.find_by(date: @selected_date)
  end

  def import
    if params[:file].present?
      Flower.import_from_csv(params[:file])
      redirect_to root_path, notice: "CSV ファイルが正常にインポートされました"
    else
      redirect_to root_path, alert: "CSV ファイルが選択されていません"
    end
  end
end