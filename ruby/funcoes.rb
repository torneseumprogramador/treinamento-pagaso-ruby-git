require 'json'
require_relative 'db/postgres_persistencia.rb'
require_relative 'db/json_persistencia.rb'
require_relative 'repositorio/persistencia.rb'
require_relative 'models/aluno.rb'

def carregar_dados_json
  Persistencia.new(PostgresPersistencia.new(Aluno)).todos
  # Persistencia.new(JsonPersistencia.new("clientes")).todos
end

def salvar_dados_json(cliente)
  Persistencia.new(PostgresPersistencia.new(Aluno)).salvar(cliente)
  # Persistencia.new(JsonPersistencia.new("clientes")).salvar(cliente)
end

def cadastro
    aluno = Aluno.new
    puts("Digite o nome do aluno")
    aluno.nome = gets.chomp
  
    3.times do |i|
      puts("Digite o nome da matéria")
      nome_materia = gets.chomp
      puts("Digite a nota")
      nota = gets.to_i
      aluno.notas ||= []
      aluno.notas.push({ materia: nome_materia, nota: nota })
    end
  
    salvar_dados_json(aluno)
  end

def relatorio_alunos
  alunos = carregar_dados_json

  system "clear" or system "cls"

  alunos.each do |aluno|
    puts("Nome: #{aluno.nome}")
    puts("Notas:")
    aluno.notas.each do |nota|
      puts("  #{nota["materia"]}: #{nota["nota"]}")
    end

    media = aluno.notas.map{|materia_com_nota| materia_com_nota["nota"] }.sum / aluno.notas.length
    puts("Media: #{media}")
    puts("-----------------------")
  end

  puts "Digite enter para continuar"
  gets
end