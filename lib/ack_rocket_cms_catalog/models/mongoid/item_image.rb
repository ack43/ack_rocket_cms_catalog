module AckRocketCmsCatalog
  module Models
    module Mongoid
      module ItemImage
        extend ActiveSupport::Concern
        included do
          embedded_in :item, class_name: "AckRocketCmsCatalog::Item"

          include RocketCMSMongoidPaperclip
          rocket_cms_mongoid_attached_file(:image,
                    styles: AckRocketCmsCatalog.configuration.item_images_image_styles,
                    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
                    processors: [:rails_admin_jcropper]
          )

          include Mongoid::EmbeddedFindable
          def self.find(id)
            find_through(::Item, 'item_images', id)
          end
        end
      end
    end
  end
end
