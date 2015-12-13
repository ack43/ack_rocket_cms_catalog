class ItemCategory
    include AckRocketCMSCatalog::Models::ItemCategory
  # RocketCMS.apply_patches self
  rails_admin &AckRocketCMSCatalog.item_category_config
end
