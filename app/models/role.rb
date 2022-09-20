class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.pluck(:actor)
    end

    def locations
        self.auditions.pluck(:location)
    end

    def lead
       if self.auditions.find_by(hired: true)
        return self.auditions.find_by(hired: true)
       else 
        return "no actor has been hired for this role"
       end
    end

    def understudy
        if self.auditions.where(hired: true)[1]
            return self.auditions.where(hired: true)[1]
        else
            return "no actor has been hired for understudy for this role"
        end
    end
end