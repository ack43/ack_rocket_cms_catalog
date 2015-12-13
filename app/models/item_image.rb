class ItemImage < EmbeddedGalleryImage
  include AckRocketCMSCatalog::Models::ItemImage
  # RocketCMS.apply_patches self
  rails_admin &AckRocketCMSCatalog.item_image_config
end
