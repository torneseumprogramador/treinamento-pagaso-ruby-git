require 'json'


def carregar_dados_json
  file_path = 'db/clientes.json'

  if File.exist?(file_path)
    file = File.read(file_path)
    return JSON.parse(file)
  end

  []
end

def salvar_dados_json(cliente)
  file_path = 'db/clientes.json'

  clientes = carregar_dados_json
  clientes << cliente
  json_clientes = JSON.generate(clientes)
  File.write(file_path, json_clientes)
end

def cadastro
    aluno = {}
    puts("Digite o nome do aluno")
    aluno["nome"] = gets.chomp
  
    3.times do |i|
      puts("Digite o nome da matéria")
      nome_materia = gets.chomp
      puts("Digite a nota")
      nota = gets.to_i
      aluno["notas"] ||= []
      aluno["notas"].push({ materia: nome_materia, nota: nota })
    end
  
    salvar_dados_json(aluno)
  end

def relatorio_alunos
  alunos = carregar_dados_json

  system "clear" or system "cls"

  alunos.each do |aluno|
    puts("Nome: #{aluno["nome"]}")
    puts("Notas:")
    aluno["notas"].each do |nota|
      puts("  #{nota["materia"]}: #{nota["nota"]}")
    end

    media = aluno["notas"].map{|materia_com_nota| materia_com_nota["nota"] }.sum / aluno["notas"].length
    puts("Media: #{media}")
    puts("-----------------------")
  end

  puts "Digite enter para continuar"
  gets
end