module AckRocketCmsCatalog
  module Models
    module ItemCategory
      extend ActiveSupport::Concern
      include RocketCMS::Model
      include AckRocketCmsCatalog.orm_specific('ItemCategory')

      include Enableable
      include Seoable
      include SitemapData

      include ManualSlug

      included do
        manual_slug :name

        def clean_excerpt
          Rails::Html::FullSanitizer.new.sanitize(self.excerpt.strip)
        end

        def clean_content
          Rails::Html::FullSanitizer.new.sanitize(self.content.strip)
        end

        def items
          AckRocketCmsCatalog::Item.in(item_category_ids: self.id)
        end

        def all_items
          AckRocketCmsCatalog::Item.any_in(item_category_ids: self.self_and_descendants.map(&:id))
        end
      end
    end
  end
end
