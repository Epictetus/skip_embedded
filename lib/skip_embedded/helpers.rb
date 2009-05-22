module SkipEmbedded
  module Helpers
    include Ui
    include Sprite

    def self.included(base)
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => [Dependencies[:jquery]]
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :skip => %w[dropdown_navigation labeled_text_field flash_message]
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :skip_fckeditor => %w[fckeditor/fckeditor skip_fckeditor_config]

      # TODO skip/style などをどの程度共通化するかを検討、それはではskip_embeddedという別名で
      ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :skip_embedded => %w[skip_embedded sprites/sprites.css]
    end
  end
end
