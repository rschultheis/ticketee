class Comment < ActiveRecord::Base

  before_create :set_previous_state
  after_create :set_ticket_state

  delegate :project, :to => :ticket

  belongs_to :user
  belongs_to :ticket
  belongs_to :state
  belongs_to :previous_state, :class_name => "State"

  validates_presence_of :text

  after_create :creator_watches_ticket

private
  def set_previous_state
     self.previous_state = ticket.state
  end

  def set_ticket_state
    self.ticket.state = self.state
    self.ticket.save!
  end

  def creator_watches_ticket
    ticket.watchers << user
  end
end
