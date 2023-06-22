require 'pg'

class PostgresPersistenciaAlunos
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

    def todos()
        self.open
        result = @conn.exec('SELECT * FROM alunos')
        alunos = []
        result.each do |re|
            re["notas"] = JSON.parse(re["notas"])
            alunos << re
        end
        self.close
        return alunos
    end

    def salvar(obj)
        self.open
        @conn.exec_params('INSERT INTO alunos (nome, notas) VALUES ($1, $2)', [obj["nome"], obj["notas"].to_json])
        self.close
    end
end