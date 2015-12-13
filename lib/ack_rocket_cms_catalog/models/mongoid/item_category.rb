module AckRocketCMSCatalog
  module Models
    module Mongoid
      module ItemCategory
        extend ActiveSupport::Concern
        included do
          field :name, type: String, localize: RocketCMS.configuration.localize, default: ""

          include RocketCMSMongoidPaperclip
          rocket_cms_mongoid_attached_file(:image,
                    styles: AckRocketCMSCatalog.configuration.item_category_image_styles,
                    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
          )

          acts_as_nested_set
          scope :sorted, -> { order_by([:lft, :asc]) }

          field :excerpt,   type: String, localize: RocketCMS.configuration.localize, default: ""
          field :content,   type: String, localize: RocketCMS.configuration.localize, default: ""

          embeds_many :item_categoty_images, cascade_callbacks: true
          alias :images :item_categoty_images
          accepts_nested_attributes_for :item_categoty_images, allow_destroy: true
        end
      end
    end
  end
end
