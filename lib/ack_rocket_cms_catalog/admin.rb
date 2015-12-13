module AckRocketCMSCatalog
  class << self
    def item_config(fields = {})
      Proc.new {
        navigation_label "Каталог"

        # field :views_count do
        #   read_only true
        # end

        list do
          scopes [:sorted, :enabled, nil]

          field :enabled, :toggle
          field :name
          field :price
          field :item_categories
          field :image
        end

        edit do
          field :enabled, :toggle
          field :name
          field :slugs, :enum do
            enum_method do
              :slugs
            end
            visible do
              bindings[:view].current_user.admin?
            end
            multiple do
              true
            end
          end
          field :text_slug
          field :image, :jcrop do
            jcrop_options do
              :image_jcrop_options
            end
          end
          field :item_categories
          field :excerpt, :ck_editor
          field :content, :ck_editor

          field :item_images

          fields.each_pair do |name, type|
            if type.nil?
              field name
            else
              if type.is_a?(Array)
                field name, type[0], &type[1]
              else
                field name, type
              end
            end
          end

          group :seo, &RocketCMS.seo_config
          group :sitemap_data, &RocketCMS.sitemap_data_config
        end

        nested_set({max_depth: 1, scopes: []})

        sort_embedded(
            {
                fields: [:item_images]
            }
        )

        if block_given?
          yield
        end
      }
    end


    def item_category_config(fields = {})
      Proc.new {
        navigation_label "Каталог"

        list do
          scopes [:sorted, :enabled, nil]

          field :enabled, :toggle
          field :name
          field :image

          field :items do
            read_only true

            pretty_value do
              bindings[:object].items.to_a.map { |h|
                (bindings[:view] || bindings[:controller]).link_to(h.name, (bindings[:view] || bindings[:controller]).rails_admin.show_path(model_name: "item", id: h.id), title: h.name)
              }.join("<br>").html_safe
            end
          end
        end

        edit do
          field :enabled, :toggle
          field :name
          field :slugs, :enum do
            enum_method do
              :slugs
            end
            visible do
              bindings[:view].current_user.admin?
            end
            multiple do
              true
            end
          end
          field :text_slug
          field :image, :jcrop do
            jcrop_options do
              :image_jcrop_options
            end
          end
          field :excerpt, :ck_editor
          field :content, :ck_editor

          fields.each_pair do |name, type|
            if type.nil?
              field name
            else
              if type.is_a?(Array)
                field name, type[0], &type[1]
              else
                field name, type
              end
            end
          end

          group :seo, &RocketCMS.seo_config
          group :sitemap_data, &RocketCMS.sitemap_data_config

          field :items do
            read_only true
            help 'Список товаров'

            pretty_value do
              bindings[:object].items.to_a.map { |h|
                (bindings[:view] || bindings[:controller]).link_to(h.name, (bindings[:view] || bindings[:controller]).rails_admin.edit_path(model_name: "item", id: h.id), title: h.name)
              }.join("<br>").html_safe
            end
          end
        end

        show do
          field :name
          field :sidebar_title
          field :slugs, :enum do
            enum_method do
              :slugs
            end
            visible do
              bindings[:view].current_user.admin?
            end
            multiple do
              true
            end
          end
          field :text_slug
          field :enabled
          field :image
          field :excerpt
          field :content

          field :items do
            read_only true

            pretty_value do
              bindings[:object].items.to_a.map { |h|
                (bindings[:view] || bindings[:controller]).link_to(h.name, (bindings[:view] || bindings[:controller]).rails_admin.show_path(model_name: "item", id: h.id), title: h.name)
              }.join("<br>").html_safe
            end
          end
        end

        nested_set({max_depth: 2, scopes: []})

        sort_embedded(
            {
                fields: [:item_category_images]
            }
        )

        if block_given?
          yield
        end
      }
    end


    def item_image_config(fields = {})
      Proc.new {
        RocketCMS.embedded_image_config(fields)
      }
    end


    def item_category_image_config(fields = {})
      Proc.new {
        RocketCMS.embedded_image_config(fields)
      }
    end

    
  end
end
