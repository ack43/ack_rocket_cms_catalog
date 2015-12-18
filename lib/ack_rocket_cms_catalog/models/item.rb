module AckRocketCmsCatalog
  module Models
    module Item
      extend ActiveSupport::Concern
      include RocketCMS::Model
      include AckRocketCmsCatalog.orm_specific('Item')

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
      end
    end
  end
end
