require 'byebug'


=begin

n = next no debugger
s = step into no debugger
l = list para mostrar onde está o cursor no debugger
c = continue  no debugger
q = sair do debugger
exit = sai do debugger sem perguntar

=end

lista = [1,2,3,4]
lista.push(5) # adiciona dado no array
variavel = lista.pop() # remove dado do array

print("================\n")
print(lista)
print("================\n")



# $estrutura = Array("nome"=> "teste", "telefone" => "123412")
# echo $estrutura["nome"]
# echo $estrutura["telefone"]

# hash

debugger

estrutura = { "nome"=> "teste", "telefone" => "123412" }
estrutura_sym = { nome: "teste", telefone: "123412" }


nota = 100

if nota >= 90
  puts "Você tirou uma nota excelente!"
elsif nota >= 70
  puts "Você tirou uma nota boa."
else
  puts "Sua nota foi abaixo da média."
end



dia_da_semana = "segunda"

case dia_da_semana
when "segunda"
  puts "Hoje é segunda-feira."
when "terça"
  puts "Hoje é terça-feira."
when "quarta"
  puts "Hoje é quarta-feira."
when "quinta"
  puts "Hoje é quinta-feira."
when "sexta"
  puts "Hoje é sexta-feira."
when "sábado", "domingo"
  puts "Hoje é fim de semana."
else
  puts "Dia inválido."
end


print("\n\n\n\n\n\n\n")


print("Digite o seu nome:")
nome = gets


print ("Olá Zacarias") if(nome == "Zacarias")

if(nome == "Zacarias")
    print ("Olá Zacarias")
end


if(nome == "Zacarias"); print ("Olá Zacarias"); end


print ("Olá Zacarias") if nome == "Zacarias"



print("O nome digitado foi: #{nome}")





[1,2,3].each { |i | print(i) }

[1,2,3].each do |i |
    print(i)
end


# looping proxima aula