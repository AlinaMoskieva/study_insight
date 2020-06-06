class CustomFieldDecorator < ApplicationDecorator
  delegate :id

  def title
    return "Новый дополнительный раздел" unless id

    "Обновить дополнительный раздел"
  end
end
