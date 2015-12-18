module AckRocketCmsCatalog # AckRocketCmsCatalog
  class ItemCategory
    include AckRocketCmsCatalog::Models::ItemCategory
    # RocketCMS.apply_patches self
    rails_admin &AckRocketCmsCatalog.item_category_config
  end
end
