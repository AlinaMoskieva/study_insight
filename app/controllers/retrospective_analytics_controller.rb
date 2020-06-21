class RetrospectiveAnalyticsController < ApplicationController
  expose :department
  expose :curriculum, -> { department.curriculums.find(params[:target]) }
  expose :old_curriculum, -> { department.curriculums.find(params[:compare_with]) }
  expose :curriculum_analysis, ->{ curriculum_analysis }

  def index; end

  private

  def curriculum_analysis
    CurriculumsComparator.new(target: curriculum, compare_with: old_curriculum).call
  end
end