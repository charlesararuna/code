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
    #'ACCOUNT_LEVEL_FEATURE_DEFAULTS'=> '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nvalue:\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: inbound_emails\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: channel_email\n  enabled: true\n  help_url: https://chwt.app/hc/email\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: channel_facebook\n  enabled: true\n  help_url: https://chwt.app/hc/fb\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: channel_twitter\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: ip_lookup\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: disable_branding\n  enabled: false\n  premium: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: email_continuity_on_api_channel\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: help_center\n  enabled: true\n  help_url: https://chwt.app/hc/help-center\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: agent_bots\n  enabled: false\n  help_url: https://chwt.app/hc/agent-bots\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: macros\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: agent_management\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: team_management\n  enabled: true\n  help_url: https://chwt.app/hc/teams\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: inbox_management\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: labels\n  enabled: true\n  help_url: https://chwt.app/hc/labels\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: custom_attributes\n  enabled: true\n  help_url: https://chwt.app/hc/custom-attributes\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: automations\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: canned_responses\n  enabled: true\n  help_url: https://chwt.app/hc/canned\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: integrations\n  enabled: true\n  help_url: https://chwt.app/hc/integrations\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: voice_recorder\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: mobile_v2\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: channel_website\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: campaigns\n  enabled: true\n  help_url: https://chwt.app/hc/campaigns\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: reports\n  enabled: true\n  help_url: https://chwt.app/hc/reports\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: crm\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: auto_resolve_conversations\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: custom_reply_email\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: custom_reply_domain\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: audit_logs\n  enabled: false\n  premium: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: response_bot\n  enabled: false\n  premium: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: message_reply_to\n  enabled: false\n  help_url: https://chwt.app/hc/reply-to\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: insert_article_in_reply\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: inbox_view\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: sla\n  enabled: false\n  premium: true\n  help_url: https://chwt.app/hc/sla\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: help_center_embedding_search\n  enabled: false\n  premium: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: linear_integration\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: captain_integration\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: custom_roles\n  enabled: false\n  premium: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: chatwoot_v4\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: kanban_board\n  enabled: true\n  premium: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: schedule_messages\n  enabled: true\n  premium: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: report_v4\n  display_name: Report V4\n  enabled: true\n  deprecated: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: contact_chatwoot_support_team\n  display_name: Contact Chatwoot Support Team\n  enabled: true\n  chatwoot_internal: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: shopify_integration\n  display_name: Shopify Integration\n  enabled: false\n  chatwoot_internal: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: search_with_gin\n  display_name: Search messages with GIN\n  enabled: false\n  chatwoot_internal: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: channel_instagram\n  display_name: Instagram Channel\n  enabled: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: crm_integration\n  display_name: CRM Integration\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: channel_voice\n  display_name: Voice Channel\n  enabled: false\n  chatwoot_internal: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: notion_integration\n  display_name: Notion Integration\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: captain_integration_v2\n  display_name: Captain V2\n  enabled: false\n  premium: true\n  chatwoot_internal: true\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: whatsapp_embedded_signup\n  display_name: WhatsApp Embedded Signup\n  enabled: false\n- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  name: whatsapp_campaign\n  display_name: WhatsApp Campaign\n  enabled: false\n',
    #'ENABLE_MESSENGER_CHANNEL_HUMAN_AGENT'           => false,
    #'VAPID_KEYS'            => '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nvalue: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  public_key: BD1lmtR2asIQalZXfetT0Tr8E1yFtDfWxGqm4naoTt0E6aZtcGQuyxdVnrmS2LsxmRDigco-dznJ2ls02_oqkJE=\n  private_key: gY-NCfLp8grlGToJ3jm74Lh8VxQaB0848stxkvZeFuc=\n'

  {
    'INSTALLATION_NAME'     => 'Blue7',
    'LOGO_THUMBNAIL'        => 'https://blue7.com.br/wp-content/uploads/2025/05/logo-01-b7-1-e1746982547943.png',
    'LOGO'                  => 'https://blue7.com.br/wp-content/uploads/2025/05/logo-01-b7.png',
    'LOGO_DARK'             => 'https://blue7.com.br/wp-content/uploads/2025/05/logo-01-branca-b7.png',
    'BRAND_URL'             => 'https://www.blue7.com.br',
    'WIDGET_BRAND_URL'      => 'https://www.blue7.com.br',
    'BRAND_NAME'            => 'Blue7',
    'TERMS_URL'             => 'https://blue7.com.br/termo-de-uso/',
    'PRIVACY_URL'           => 'https://blue7.com.br/politica-de-privacidade/',
    'DISPLAY_MANIFEST'      => false
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
