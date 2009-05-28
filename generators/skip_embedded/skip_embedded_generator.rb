class SkipEmbeddedGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      assets = %w[
        app/views/layouts/skip_embedded.html.erb
        app/views/shared/_flash_message.html.erb
        app/views/shared/_skip_full_text_search_form.html.erb
        config/initial_settings.yml
        lib/tasks/skip_embedded.rake
        public/blank.html
        public/javascripts/dropdown_navigation.js
        public/javascripts/labeled_text_field.js
        public/javascripts/skip/skip_fckeditor_config.js
        public/javascripts/flash_message.js
      ]

      assets.map{|asset| File.dirname(asset) }.uniq.each{|asset| m.directory(asset) }
      assets.each{|asset| m.file asset, asset }

      m.dependency('skip_embedded_stylesheets', [])

      insert_application_helper(m)
      insert_application_controller(m)
      insert_sessions_controller(m)
    end
  end

  private
  def insert_application_helper(manifest)
    insert_file( manifest, "app/helpers/application_helper.rb",
                /^module ApplicationHelper$/,
                "\n  include SkipEmbedded::Helpers")
  end

  def insert_application_controller(manifest)
    insert_file( manifest, "app/controllers/application.rb",
                /^\s+include Repim::Application\s*$/,
                "\n  include SkipEmbedded::OpenIdSso::Authentication")
  end

  def insert_sessions_controller(manifest)
    insert_file( manifest, "app/controllers/sessions_controller.rb",
                /^\s+include Repim::RelyingParty\s*$/,
                "\n  include SkipEmbedded::OpenIdSso::SessionManagement")
  end

  def insert_file(manifest, file, pattern, text)
    logger.edit_file(file)
    return if options[:pretend]

    case options[:command]
    when :create  then manifest.gsub_file(file, pattern){|head| head + text }
    when :destroy then manifest.gsub_file(file, text, '')
    end
  end
end
