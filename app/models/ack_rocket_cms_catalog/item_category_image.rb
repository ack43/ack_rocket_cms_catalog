module AckRocketCmsCatalog # AckRocketCmsCatalog
  class ItemCategoryImage < EmbeddedGalleryImage
    include AckRocketCmsCatalog::Models::ItemCategoryImage
    # RocketCMS.apply_patches self
    rails_admin &AckRocketCmsCatalog.item_category_image_config
  end
end
