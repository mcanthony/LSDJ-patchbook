atom_feed :language => 'en-US' do |feed|
feed.title "New instruments on LSDJ Patch Book"
feed.updated(@instruments.blank? ? Time.now : @instruments.first.created_at)

@instruments.each do |instrument|
feed.entry instrument, :published => instrument.created_at do |entry|
  entry.title instrument.name

  entry.comments do |comments|
    instrument.comment.each do |comment1|
      comments.comment do |comment|
        comment.author comment1.user.login
        comment.content comment1.comment
      end
    end
  end

end
end
end