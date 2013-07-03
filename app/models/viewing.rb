class Viewing < ActiveRecord::Base
  attr_accessible :participants, :viewer_id, :completed_at, :training_session_id, :site_id
  
  belongs_to :training_session
  belongs_to :viewer
  belongs_to :site
  
  validates :viewer_id, :presence => true
  validates :training_session_id, :presence => true
  
  def complete_viewing!
    self.completed_at = Time.zone.now
    self.save!
  end
  
  def self.search(search)
    if search
      joins(:training_session, :viewer, :site).where(
        'training_sessions.name LIKE ?
         OR viewers.name LIKE ?
         OR sites.name LIKE ?', 
         "%#{search}%", "%#{search}%", "%#{search}%").order("created_at DESC")
    else
      order("created_at DESC")
    end
  end
  
  def self.viewed_between(start_date = nil, end_date = nil)
    start = Date.parse(start_date).beginning_of_day unless start_date.blank?
    stop = Date.parse(end_date).end_of_day unless end_date.blank?
    if start && stop
      where(created_at: start..stop)
    elsif stop
      where("viewings.created_at <= ?", stop)
    elsif start_date
      where("viewings.created_at >= ?", start)
    else
      where("viewings.created_at <= '3000-01-01'")
    end
  end
  
end
