class CreateGamedatas < ActiveRecord::Migration
  def change
    create_table :Gamedata do |t| # 「:data」がテーブル名
      t.integer :data
      t.timestamps  null: false
    end
  end
end
