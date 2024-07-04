module TasksHelper
  def task_priority(priority)
    case priority
    when "high"
      content_tag(:span, "High", class: " leading-5 inline-flex font-bold px-2 rounded-full bg-green-700")
    when "medium"
      content_tag(:span, "Medium", class: " leading-5 inline-flex font-bold px-2 rounded-full bg-yellow-700")
    when "low"
      content_tag(:span, "Low", class: " leading-5 inline-flex font-bold px-2 rounded-full bg-red-700")
    end
  end
end
