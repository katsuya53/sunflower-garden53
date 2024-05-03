require 'csv' #CSVモジュールの起動 コンソールにて Flower.import_from_csv('data/flowers.csv')

class Flower < ApplicationRecord
  attribute :date, :date
  attribute :flower_name, :string

  has_one_attached :flower_image


  def self.import_from_csv(file_path)
    # すべての既存のレコードを削除
    Flower.destroy_all
    
    # トランザクションの開始
    transaction do
      CSV.foreach(file_path, headers: true) do |row|
        date = transform_date(row['日付'])
        flower_name = row['花の名前']
        Flower.create(date: date, flower_name: flower_name)
      end
    end
  end

  private

  def self.transform_date(date_str)
    # 日付のフォーマットを変換する
    # 例: '01-01' => '2024-01-01'
    month, day = date_str.split('-').map(&:to_i)
    year = Date.current.year
    Date.new(year, month, day)
  end
end