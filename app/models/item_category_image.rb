class ItemCategoryImage < EmbeddedGalleryImage
  include AckRocketCMSCatalog::Models::ItemCategoryImage
  # RocketCMS.apply_patches self
  rails_admin &AckRocketCMSCatalog.item_category_image_config
end
