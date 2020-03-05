user = User.new
user.email = 'matthew.dauphin01@stclairconnect.ca'
user.encrypted_password = 'password'

for i in 1..20
  @article = Article.new
  @article.title = "Will #{Faker::Company.name} really #{Faker::Company.bs}?"
  paragraph_1 = Faker::Lorem.paragraphs.join(' ')
  paragraph_2 = Faker::Books::Lovecraft.paragraphs.join(' ')
  paragraph_3 = Faker::Hipster.paragraphs.join(' ')
  @article.user = user
  @article.content = "#{paragraph_1} <br /> #{paragraph_2} <br /> #{paragraph_3}"
  if @article.save
    p "#{@article.title} has been saved"
    for ii in 1..10
      @comment = Comment.new
      @comment.article = @article
      @comment.message = Faker::Hacker.say_something_smart
      @comment.user = user
      if @comment.save
        p "Comment #{ii} has been saved for article #{@article.title}"
      else
        p @comment.errors
      end
    end
  else
    p @article.errors
  end
end
