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

  def toggle_watching_button
    text = if @ticket.watchers.include?(current_user)
      "Stop watching this ticket"
           else
      "Watch this ticket"
           end
    button_to(text, watch_project_ticket_path(@ticket.project, @ticket))
  end
end
