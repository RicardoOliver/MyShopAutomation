# Importe as bibliotecas necessárias
require 'cucumber'
require 'report_builder'

# Defina o método After para execução após cada cenário
After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')

  # Simula a função de tirar foto (substitua com sua própria lógica)
  tirar_foto(scenario_name.downcase, scenario.failed? ? 'falhou' : 'passou')
end

# Defina um bloco de código a ser executado quando o processo terminar
at_exit do
  # Obtenha a data atual no formato dia-mês-ano
  t = Time.now.strftime("%d-%m-%Y")

  # Defina informações adicionais para o relatório de teste
  infos = {
    "Dispositivo" => "WEB",
    "Data do Teste" => t
  }

  # Configura o ReportBuilder com as opções apropriadas
  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/report_#{t}"
    config.report_types = [:html]
    config.report_title = "Bradoc - Testes Automatizados"
    config.additional_info = infos
    config.color = "blue"
  end

  # Gere o relatório de teste usando as opções definidas acima
  ReportBuilder.build_report
end

# Método fictício para simular tirar uma foto
def tirar_foto(nome_cenario, status)
  # Implemente a lógica real para tirar uma foto do cenário
  puts "Tirando foto do cenário '#{nome_cenario}' que #{status}"
end
