class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def dev_freebies
        self.freebies.map {|freebie| freebie.item_name}
    end

    def dev_co
        self.companies.map {|co| co.name}
    end

    def recieved_one(item_name)
        item = self.freebies.find_by(item_name: item_name)

        if item != nil
            true
        else
            false
        end
    end

    def give_away(dev, freebie)
        #get freebie dev_id from params
        input_freebie_dev_id = Freebie.where(item_name: freebie).pick(:dev_id)
        input_dev_id = Dev.where(name: dev).pick(:id)
        #make sure if is the current de
        if self.id === input_freebie_dev_id
        curr_freebie = Freebie.where(item_name: freebie)
        curr_freebie.update(dev_id: input_dev_id)
        end
    end

end
