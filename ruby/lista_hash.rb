
require 'byebug'
clientes = []
cliente = {}

puts("Digite o nome")
cliente["nome"] = gets

puts("Digite o telefone")
cliente["telefone"] = gets

clientes.push(cliente)

debugger
x = ""