module TicketsHelper
  def state_for(comment)
    if comment.state
      if comment.previous_state && comment.previous_state != comment.state
        "#{render comment.previous_state} &rarr; #{render comment.state}".html_safe
      else
        render comment.state
      end
    end
  end
end
