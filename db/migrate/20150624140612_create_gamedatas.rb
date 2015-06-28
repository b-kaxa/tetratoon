class CreateGamedatas < ActiveRecord::Migration
  def change
    create_table :Gamedata do |t| # 「:Gamedata」がテーブル名
      t.integer :data
      t.timestamps  null: false
    end
  end
end
