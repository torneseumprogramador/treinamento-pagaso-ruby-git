require 'pg'

class PostgresPersistencia
    def initialize(klass)
        @klass = klass
    end

    def open
        @conn = PG.connect(
            host: 'localhost',
            port: 5432,
            dbname: 'persistencia_pagaso',
            user: 'danilo',
            password: 'danilo'
        )
    end

    def close
        @conn.close
    end

    def todos
        self.open
        result = @conn.exec("SELECT * FROM #{@klass.to_s.downcase}s")
        alunos = []
        result.each do |re|
            a = @klass.new
            propriedades = self.get_propriedades(a)
            propriedades.each do |propriedade|
                valor = JSON.parse(re[propriedade]) rescue re[propriedade]
                a.send("#{propriedade}=", valor)
            end

            alunos << a
        end
        self.close
        return alunos
    end

    def salvar(obj)
        self.open
        propriedades = self.get_propriedades(obj)
        valores = self.get_valores_propriedades(obj)
        @conn.exec_params("INSERT INTO #{@klass.to_s.downcase}s (#{propriedades.join(", ")}) VALUES ($1, $2)", valores)
        self.close
    end

    def apagar_por_id(id)
        self.open
        @conn.exec_params("delete from #{@klass.to_s.downcase}s where id = $1", id)
        self.close
    end
    

    def criar_tabela
        self.open
        tabela = @klass.to_s.downcase + 's'
        propriedades = self.get_propriedades(@klass.new)
        propriedades_sql = propriedades.map { |prop| "#{prop} TEXT" }.join(", ")
        @conn.exec("CREATE TABLE IF NOT EXISTS #{tabela} (id SERIAL PRIMARY KEY, #{propriedades_sql})")
        self.close
    end

    private

    def get_valores_propriedades(obj)
        valores = []
        self.get_propriedades(obj).each do |propriedade|
            valores << obj.send(propriedade).to_json
        end
        valores
    end

    def get_propriedades(obj)
        (obj.methods - Class.methods).map{|p| p.to_s }.select{|p| !p.include?("=") } rescue []
    end
end