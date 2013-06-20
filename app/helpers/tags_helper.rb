module TagsHelper
  def tags_for(video)
    tag_names = video.tags.collect { |t| link_to(t.name, tag_path(t)) }.to_sentence
    raw "#{tag_names}"
  end
end
