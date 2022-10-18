class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def co_freebies
        self.freebies.map {|freeb| freeb.item_name }
    end

    def co_devs
        self.devs.map {|dev| dev.name}
    end

    def give_freebie(dev, item_name, value)
        #gives instance of dev class according to dev name
        current_dev_id = Dev.where(name: dev).pick(:id)

        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: current_dev_id)
    end

    def self.oldest_company
        self.minimum(:founding_year)
    end
end

# returns the Company instance with the earliest founding year

