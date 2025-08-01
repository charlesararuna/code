#!/usr/bin/env ruby

# 🚀 Dchat Blue7 - Desbloqueio e personalização do Chatwoot
# Execute com: wget -qO- https://seu-link/unlock_blue7.rb | bundle exec rails runner -

require 'fileutils'

puts "🚀 === Dchat Blue7 - Iniciando desbloqueio e personalização ==="

begin
  # Configura plano enterprise
  plan = InstallationConfig.find_or_initialize_by(name: 'INSTALLATION_PRICING_PLAN')
  plan.value = 'enterprise'
  plan.save!
  puts "✅ INSTALLATION_PRICING_PLAN => enterprise"

  quantity = InstallationConfig.find_or_initialize_by(name: 'INSTALLATION_PRICING_PLAN_QUANTITY')
  quantity.value = 9_999_999
  quantity.save!
  puts "✅ INSTALLATION_PRICING_PLAN_QUANTITY => 9_999_999"

  # Configura identidade Blue7
  {
    'INSTALLATION_NAME'     => 'Blue7',
    'LOGO_THUMBNAIL'        => 'https://blue7.com.br/wp-content/uploads/2025/05/logo-01-b7-1-e1746982547943.png',
    'LOGO'                  => 'https://blue7.com.br/wp-content/uploads/2025/05/logo-01-b7.png',
    'LOGO_DARK'             => 'https://blue7.com.br/wp-content/uploads/2025/05/logo-01-branca-b7.png',
    'BRAND_URL'             => 'https://www.blue7.com.br',
    'WIDGET_BRAND_URL'      => 'https://www.blue7.com.br',
    'BRAND_NAME'            => 'Blue7',
    'TERMS_URL'             => 'https://blue7.com.br/termo-de-uso/',
    'PRIVACY_URL'           => 'https://blue7.com.br/politica-de-privacidade/'
  }.each do |key, value|
    item = InstallationConfig.find_or_initialize_by(name: key)
    item.value = value
    item.save!
    puts "✅ #{key} => #{value}"
  end

  # Limpa alerta premium do Redis
  if defined?(Redis::Alfred)
    Redis::Alfred.delete(Redis::Alfred::CHATWOOT_INSTALLATION_CONFIG_RESET_WARNING)
    puts '✅ Redis::Alfred - alerta removido'
  else
    puts '⚠️  Redis::Alfred não está definido'
  end

rescue => e
  puts "❌ Erro ao configurar: #{e.message}"
end

# Atualiza fallback no arquivo chatwoot_hub.rb
begin
  possible_paths = [
    '/app/lib/chatwoot_hub.rb',
    '/chatwoot/lib/chatwoot_hub.rb',
    File.join(Rails.root, 'lib', 'chatwoot_hub.rb'),
    './lib/chatwoot_hub.rb'
  ]
  hub_file = possible_paths.find { |path| File.exist?(path) }

  if hub_file
    puts "📁 Atualizando fallback: #{hub_file}"
    backup_file = "#{hub_file}.backup.#{Time.now.strftime('%Y%m%d_%H%M%S')}"
    FileUtils.cp(hub_file, backup_file)

    content = File.read(hub_file)
    original = content.dup

    content.gsub!(
      /(InstallationConfig\.find_by\(name:\s*['"]INSTALLATION_PRICING_PLAN['"]\)&?\.value\s*\|\|\s*)['"]community['"]/,
      "\\1'enterprise'"
    )
    content.gsub!(
      /(InstallationConfig\.find_by\(name:\s*['"]INSTALLATION_PRICING_PLAN_QUANTITY['"]\)&?\.value\s*\|\|\s*)0/,
      "\\19999999"
    )

    if content != original
      File.write(hub_file, content)
      puts "✅ Fallbacks atualizados"
    else
      puts "ℹ️  Fallbacks já estavam corretos"
    end
  else
    puts "⚠️  chatwoot_hub.rb não encontrado"
  end

rescue => e
  puts "❌ Erro ao atualizar fallback: #{e.message}"
end

puts ""
puts "🎉 === Dchat Blue7 - Finalizado ==="
puts "🔁 Reinicie o container para aplicar as mudanças"
puts ""
