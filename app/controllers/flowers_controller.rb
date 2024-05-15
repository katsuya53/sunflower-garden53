class FlowersController < ApplicationController
  def index
    # セレクトボックスからの日付を日本時間に変換
    @selected_date = params[:selected_date].present? ? Date.parse(params[:selected_date]).in_time_zone('Tokyo') : Date.today

    # 日本時間での日付を使って花の情報を取得
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