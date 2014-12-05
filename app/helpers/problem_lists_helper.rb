module ProblemListsHelper

  def problem_lists_count
    ProblemList.all.count
  end

end
