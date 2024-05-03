namespace :import do
  desc "Import flowers from CSV"
  task flowers: :environment do
    Flower.import_from_csv('data/flowers.csv')
  end
end