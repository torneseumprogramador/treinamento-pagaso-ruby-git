class JsonPersistencia
    def initialize(nome_arquivo)
        @file_path = "#{File.dirname(File.expand_path($0))}/db/#{nome_arquivo}.json"
    end

    def todos
        if File.exist?(@file_path)
            file = File.read(@file_path)
            return JSON.parse(file)
        end

        [] 
    end

    def salvar(obj)
        objetos = self.todos
        objetos << obj
        json_objetos = JSON.generate(objetos)
        File.write(@file_path, json_objetos)
    end
end