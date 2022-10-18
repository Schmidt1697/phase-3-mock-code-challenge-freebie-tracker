class Freebie < ActiveRecord::Base
    belongs_to :company
    belongs_to :dev

    def freebie_dev
        self.dev
    end

    def freebie_company
        self.company
    end

    def print_details
        dev_name = self.dev.name
        item = self.item_name
        co_name = self.company.name

         "#{dev_name} owns a #{item} from #{co_name}"
    end

end
