class Persistencia 
    def initialize(driver)
        @driver = driver
    end

    def todos
        @driver.todos
    end

    def salvar(obj)
        @driver.salvar(obj)
    end
end