class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        min_height = self.attraction.min_height
        height = self.user.height
        
        if attraction.tickets > user.tickets && height < min_height
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif height < min_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif attraction.tickets > user.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else
            user.tickets -= attraction.tickets
            self.user.happiness += self.attraction.happiness_rating
            self.user.nausea += self.attraction.nausea_rating
            self.user.save
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

end
