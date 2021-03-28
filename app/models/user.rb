class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    validates_presence_of :password

    def mood
        if !self.admin
            self.nausea > self.happiness ? "sad" : "happy"
        end
    end

end
