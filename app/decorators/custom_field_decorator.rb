class CustomFieldDecorator < ApplicationDecorator
  delegate :id

  def custom_section_title
    return "Новый дополнительный раздел" unless id

    "Обновить дополнительный раздел"
  end

  def custom_section_unit_title
    return "Новая дополнительная единица раздела" unless id

    "Обновить дополнительную единицу раздела"
  end
end
