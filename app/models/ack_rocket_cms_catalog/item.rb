module AckRocketCmsCatalog # AckRocketCmsCatalog  
  class Item
    include AckRocketCmsCatalog::Models::Item
    # RocketCMS.apply_patches self
    rails_admin &AckRocketCmsCatalog.item_config
  end
end
