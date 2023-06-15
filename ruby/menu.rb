require 'byebug'
require_relative 'funcoes.rb'

alunos = []
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
      cadastro(alunos)
    when "2"

      system "clear" or system "cls"

      alunos.each do |aluno|
        puts("Nome: #{aluno[:nome]}")
        puts("Notas: #{aluno[:notas]}")

        media = aluno[:notas].map{|materia_com_nota| materia_com_nota[:nota] }.sum / aluno[:notas].length
        puts("Media: #{media}")
        puts("-----------------------")
      end

      sleep(5)
    else
      system "clear" or system "cls"
      puts("Opção inválida")
      sleep(3)
    end
end