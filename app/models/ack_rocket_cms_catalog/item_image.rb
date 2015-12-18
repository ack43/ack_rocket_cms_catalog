module AckRocketCmsCatalog # AckRocketCmsCatalog
  class ItemImage < EmbeddedGalleryImage
    include AckRocketCmsCatalog::Models::ItemImage
    # RocketCMS.apply_patches self
    rails_admin &AckRocketCmsCatalog.item_image_config
  end
end
