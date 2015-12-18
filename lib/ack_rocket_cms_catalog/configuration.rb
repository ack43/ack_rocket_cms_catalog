module AckRocketCmsCatalog
  def self.configuration
    @configuration ||= Configuration.new
  end
  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :item_image_styles
    attr_accessor :item_per_page

    attr_accessor :item_images_image_styles

    attr_accessor :item_category_image_styles
    attr_accessor :item_category_per_page

    attr_accessor :item_category_images_image_styles

    def initialize
      @item_image_styles  = {}
      @item_per_page      = 10

      @item_images_image_styles = {}

      @item_category_image_styles = {}
      @item_category_per_page     = 10

      @item_category_images_image_styles = {}
    end
  end
end
