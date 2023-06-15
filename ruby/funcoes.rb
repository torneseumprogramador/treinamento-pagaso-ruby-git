
def cadastro(alunos)
    aluno = {}
    puts("Digite o nome do aluno")
    aluno[:nome] = gets
  
    3.times do |i|
      puts("Digite o nome da matéria")
      nome_materia = gets
      puts("Digite a nota")
      nota = gets.to_i
      aluno[:notas] ||= []
      aluno[:notas].push({ materia: nome_materia, nota: nota })
      alunos << aluno
    end
  
    return alunos
  end