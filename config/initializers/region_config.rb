

require 'yaml'

region_config_path = Rails.root.join( 'config', 'region_config.yml' ).to_s
puts region_config_path
Region = YAML.load_file( region_config_path )


