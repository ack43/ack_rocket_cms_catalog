module AckRocketCmsCatalog
  module Models
    module Mongoid
      module Item
        extend ActiveSupport::Concern
        included do
          field :name, type: String, localize: RocketCMS.configuration.localize, default: ""

          include RocketCMSMongoidPaperclip
          rocket_cms_mongoid_attached_file(:image,
                    styles: AckRocketCmsCatalog.configuration.item_image_styles,
                    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
          )

          acts_as_nested_set
          scope :sorted, -> { order_by([:lft, :asc]) }

          field :excerpt,   type: String, localize: RocketCMS.configuration.localize, default: ""
          field :content,   type: String, localize: RocketCMS.configuration.localize, default: ""

          has_and_belongs_to_many :item_categories, class_name: "AckRocketCmsCatalog::ItemCategory", inverse_of: nil

          embeds_many :item_images, cascade_callbacks: true, class_name: "AckRocketCmsCatalog::ItemImage"
          alias :images :item_images
          accepts_nested_attributes_for :item_images, allow_destroy: true

          has_and_belongs_to_many :related_items, :class_name => 'AckRocketCmsCatalog::Item', :inverse_of => :related_items

          field :price,     type: Money,    default: nil, localize: RocketCMS.configuration.localize
        end
      end
    end
  end
end
