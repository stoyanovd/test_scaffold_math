class AddFigureToAnswer < ActiveRecord::Migration
  def self.up
    add_attachment :answers, :figure
  end

  def self.down
    remove_attachment :answers, :figure
  end
end
