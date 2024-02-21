require 'report_builder'
require 'date'

# Método para alterar o nome da screenshot e direcionar se o teste falhou ou não
After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')

  if scenario.failed?
    tirar_foto(scenario_name.downcase, 'falhou')
  else
    tirar_foto(scenario_name.downcase, 'passou')
  end
end

# Define um bloco de código a ser executado quando o processo terminar
at_exit do
  # Obtém a data atual no formato dia-mês-ano
  t = Time.now.strftime("%d-%m-%Y")

  # Define informações adicionais para o relatório de teste
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

  # Gera o relatório de teste usando as opções definidas acima
  ReportBuilder.build_report
end
