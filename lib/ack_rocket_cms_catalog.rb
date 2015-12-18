require "ack_rocket_cms_catalog/version"

require 'money-rails'

require 'ack_rocket_cms_mongoid'

require 'ack_rocket_cms_catalog/configuration'
require 'ack_rocket_cms_catalog/engine'
require 'ack_rocket_cms_catalog/admin'

module AckRocketCmsCatalog
  class << self
    def orm
      :mongoid
    end
    def mongoid?
      true
      # AckRocketCmsCatalog.orm == :mongoid
    end
    def active_record?
      false
      # AckRocketCmsCatalog.orm == :active_record
    end
    def model_namespace
      "AckRocketCmsCatalog::Models::#{AckRocketCmsCatalog.orm.to_s.camelize}"
    end
    def orm_specific(name)
      "#{model_namespace}::#{name}".constantize
    end
  end

  module Models
    autoload :Item,               'ack_rocket_cms_catalog/models/item'
    autoload :ItemCategory,       'ack_rocket_cms_catalog/models/item_category'
    autoload :ItemImage,          'ack_rocket_cms_catalog/models/item_image'
    autoload :ItemCategoryImage,  'ack_rocket_cms_catalog/models/item_category_image'

    module Mongoid
      autoload :Item,               'ack_rocket_cms_catalog/models/mongoid/item'
      autoload :ItemCategory,       'ack_rocket_cms_catalog/models/mongoid/item_category'
      autoload :ItemImage,          'ack_rocket_cms_catalog/models/mongoid/item_image'
      autoload :ItemCategoryImage,  'ack_rocket_cms_catalog/models/mongoid/item_category_image'
    end
  end

  module Controllers
    autoload :Items,                'ack_rocket_cms_catalog/controllers/items'
    autoload :ItemCategories,       'ack_rocket_cms_catalog/controllers/item_categories'
  end

end
