class Admin < ApplicationRecord

    def setpass(pass)
        password = pass
    end
    def passfix
        password
    end
    def authenticate pass
        pass == self.password
    end
end
