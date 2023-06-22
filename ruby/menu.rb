require 'byebug'
require_relative 'funcoes.rb'

# require_relative 'db/postgres_persistencia.rb'
# require_relative 'models/produto.rb'

# repo = PostgresPersistencia.new(Produto)
# p = Produto.new
# p.nome = "banana"
# p.preco = 3.33

# repo.salvar(p)

# todos = repo.todos

while true
    system "clear" or system "cls"

    puts("Digite uma das opcões abaixo")
    puts("1 - Cadastrar")
    puts("2 - Relatorio")
    puts("3 - Sair")

    menu = gets.strip 
    break if( menu == "3")

    case menu
    when "1"
      cadastro
    when "2"
      relatorio_alunos
    else
      system "clear" or system "cls"
      puts("Opção inválida")
      sleep(3)
    end
end