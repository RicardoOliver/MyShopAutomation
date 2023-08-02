# Importa as bibliotecas necessárias
require 'cucumber'
require 'cucumber/rake/task'

# Define a tarefa 'run_features' que aceita o parâmetro :feature
task :run_features, [:feature] do |_task, args|
  # Imprime a mensagem informando qual feature está sendo executada
  puts "Executando a feature: #{args[:feature]}"

  # Executa o Cucumber com as opções desejadas usando o valor passado para o parâmetro :feature
  sh "cucumber -t @#{args[:feature]} -p json -p pretty -p html -p firefox -p homolog"
end
