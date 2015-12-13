class Item
  include AckRocketCMSCatalog::Models::Item
  # RocketCMS.apply_patches self
  rails_admin &AckRocketCMSCatalog.item_config
end
