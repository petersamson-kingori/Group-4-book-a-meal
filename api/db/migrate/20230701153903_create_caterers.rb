class CreateCaterers < ActiveRecord::Migration[6.1]
  def change
    create_table :caterers do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :business_name

      t.timestamps
    end
  end
end
