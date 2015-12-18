if defined?(RailsAdmin)
  RailsAdmin.config do |config|
    config.excluded_models << [
        'AckRocketCmsCatalog::ItemImage', 'AckRocketCmsCatalog::ItemCategoryImage'
    ]
    config.excluded_models.flatten!
  end
end
