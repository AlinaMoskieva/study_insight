class RetrospectiveAnalyticsController < ApplicationController
  expose :department
  expose :curriculum, -> { department.curriculums.find(params[:target]) }
  expose :old_curriculum, -> { department.curriculums.find(params[:compare_with]) }
  expose :custom_attributes_diff, -> { custom_attributes_diff }
  expose :custom_sections_diff, -> { custom_sections_diff }


  def index

  end

  private

  def custom_attributes_diff
    CustomAttributesComparator.new(target: curriculum, compare_with: old_curriculum).call
  end

  def custom_sections_diff
    CustomSectionsComparator.new(target: curriculum, compare_with: old_curriculum).call
  end
end