require "rails_admin_mongo_loc/engine"

module RailsAdminMongoLoc
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types

        class Textml < RailsAdmin::Config::Fields::Base
        #class Textml < RailsAdmin::Config::Fields::Types::Text

          RailsAdmin::Config::Fields::Types::register(self)

          # CKEditor is disabled by default
          register_instance_option :ckeditor do
            false
          end

          # If you want to have a different toolbar configuration for CKEditor
          # create your own custom config.js and override this configuration
          register_instance_option :ckeditor_config_js do
            nil
          end

          #Use this if you want to point to a cloud instances of CKeditor
          register_instance_option :ckeditor_location do
            nil
          end

          #Use this if you want to point to a cloud instances of the base CKeditor
          register_instance_option :ckeditor_base_location do
            '/assets/ckeditor/'
          end

          # Codemirror is disabled by default and CKEditor takes precedence
          register_instance_option :codemirror do
            false
          end

          #Pass the theme and mode for Codemirror
          register_instance_option :codemirror_config do
            {
                :mode => 'css',
                :theme => 'night'
            }
          end

          #Pass the location of the theme and mode for Codemirror
          register_instance_option :codemirror_assets do
            {
                :mode => '/assets/codemirror/modes/css.js',
                :theme => '/assets/codemirror/themes/night.css'
            }
          end

          #Use this if you want to point to a cloud instances of CodeMirror
          register_instance_option :codemirror_js_location do
            '/assets/codemirror.js'
          end

          #Use this if you want to point to a cloud instances of CodeMirror
          register_instance_option :codemirror_css_location do
            '/assets/codemirror.css'
          end

          # bootstrap_wysihtml5
          register_instance_option :bootstrap_wysihtml5 do
            false
          end

          # If you want to have a different toolbar configuration for wysihtml5
          # you can use a Ruby hash to configure these options:
          # https://github.com/jhollingworth/bootstrap-wysihtml5/#advanced
          register_instance_option :bootstrap_wysihtml5_config_options do
            nil
          end

          register_instance_option :bootstrap_wysihtml5_css_location do
            '/assets/bootstrap-wysihtml5.css'
          end

          register_instance_option :bootstrap_wysihtml5_js_location do
            '/assets/bootstrap-wysihtml5.js'
          end

          register_instance_option :html_attributes do
            {
                :cols => '48',
                :rows => '3'
            }
          end

          register_instance_option :partial do
            :form_textml
          end
        end


        class Stringml < RailsAdmin::Config::Fields::Base
        # class Stringml < RailsAdmin::Config::Fields::Types::String

          RailsAdmin::Config::Fields::Types::register(self)

          register_instance_option :html_attributes do
            {
              :maxlength => length,
              :size => [50, length.to_i].min
            }
           end

          register_instance_option :help do
            text = (required? ? I18n.translate("admin.form.required") : I18n.translate("admin.form.optional")) + '. '
            if valid_length.present? && valid_length[:is].present?
              text += "#{I18n.translate("admin.form.char_length_of").capitalize} #{valid_length[:is]}."
            else
              max_length = [length, valid_length[:maximum] || nil].compact.min
              min_length = [0, valid_length[:minimum] || nil].compact.max
              if max_length
                if min_length == 0
                  text += "#{I18n.translate("admin.form.char_length_up_to").capitalize} #{max_length}."
                else
                  text += "#{I18n.translate("admin.form.char_length_of").capitalize} #{min_length}-#{max_length}."
                end
              end
            end
            text
          end

          register_instance_option :partial do
            :form_fieldml
          end
        end

      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  if properties[:name] == :textml
    fields << RailsAdmin::Config::Fields::Types::Textml.new(parent, properties[:name], properties)
    true
  else
    false
  end

  if properties[:name] == :stringml
    fields << RailsAdmin::Config::Fields::Types::Stringml.new(parent, properties[:name], properties)
    true
  else
    false
  end
end


