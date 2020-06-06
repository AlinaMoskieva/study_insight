class CustomFieldDecorator < ApplicationDecorator
  delegate :id

  def custom_section_title
    return "Новый дополнительный раздел" unless editing?

    "Обновить дополнительный раздел"
  end

  def custom_section_unit_title
    return "Новая дополнительная единица раздела" unless editing?

    "Обновить дополнительную единицу раздела"
  end

  def custom_attribute_title
    return "Новый дополнительный атрибут" unless editing?

    "Обновить дополнительный атрибут"
  end

  private

  def editing?
    object && id
  end
end
