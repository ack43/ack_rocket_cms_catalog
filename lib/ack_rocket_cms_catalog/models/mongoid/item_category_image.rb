module AckRocketCMSCatalog
  module Models
    module Mongoid
      module ItemCategoryImage
        extend ActiveSupport::Concern
        included do
          embedded_in :item

          include RocketCMSMongoidPaperclip
          rocket_cms_mongoid_attached_file(:image,
                    styles: AckRocketCMSCatalog.configuration.item_category_images_image_styles,
                    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
                    processors: [:rails_admin_jcropper]
          )

          include Mongoid::EmbeddedFindable
          def self.find(id)
            find_through(::ItemCategory, 'item_category_images', id)
          end
        end
      end
    end
  end
end
