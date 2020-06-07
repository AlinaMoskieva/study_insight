class RetrospectiveAnalyticsController < ApplicationController
  expose :department
  expose :curriculum, -> { department.curriculums.find(params[:target]) }
  expose :old_curriculum, -> { department.curriculums.find(params[:compare_with]) }
  expose :custom_attributes_diff, -> { custom_attributes_diff }


  def index

  end

  private

  def custom_attributes_diff
    CustomAttributesComparator.new(target: curriculum, compare_with: old_curriculum).call
  end
end