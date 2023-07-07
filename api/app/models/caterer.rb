class Caterer < ApplicationRecord
    has_secure_password

    has_many :menus, dependent: :destroy


    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: true


    after_create :create_weekly_menus

    private
  
    def create_weekly_menus
      days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  
      days_of_week.each do |day|
        menus.create(name: "#{day} Menu", description: "Menu for #{day}")
      end
    end
end
