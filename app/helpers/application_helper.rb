module ApplicationHelper
  def error_messages_for(*objects)
    options = objects.extract_options!
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten
    unless messages.empty?
      content_tag :p, :class => "error" do
        list_items = messages.map { |msg| msg }.to_sentence.capitalize
      end
    end
  end
  
  def date_for(time)
    time.strftime("%A, %b %-d %Y,%l:%M %p")
  end
end
