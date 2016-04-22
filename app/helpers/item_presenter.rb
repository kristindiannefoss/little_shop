require 'delegate'

class ItemPresenter < SimpleDelegator

    def button_type
      @button_type ||= "<%= button_to \"Item Retired\", cart_items_path(item_id: @item.id), disabled: true %>"
    end
end
