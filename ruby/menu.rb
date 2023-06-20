require 'byebug'
require_relative 'funcoes.rb'

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