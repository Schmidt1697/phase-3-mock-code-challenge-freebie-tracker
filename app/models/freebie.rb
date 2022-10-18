class Freebie < ActiveRecord::Base
    belongs_to :company
    belongs_to :dev

    def freebie_dev
        self.dev
    end

    def freebie_company
        self.company
    end

end
