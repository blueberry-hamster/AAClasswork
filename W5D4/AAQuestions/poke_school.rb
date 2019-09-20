require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
  include Singleton 

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end



##USERS



class Users
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    user = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    Users.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0
    
    Users.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Questions.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_author_id(@id)
  end
  
  def followed_questions
    Follows.followed_questions_for_user_id(@id)
  end

end


##QUESTIONS



class Questions
  attr_accessor :id, :title, :body, :user_id

  def self.find_by_id(id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Questions.new(question.first)
  end
  
  def self.find_by_author_id(user_id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    return nil unless question.length > 0

    question.each { |ques| Questions.new(ques) } 
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(@user_id) 
  end

  def replies
    Replies.find_by_question_id(@id)
  end

  def followers 
    Follows.followers_for_question_id(@id)
  end

end



##LIKES



class Likes
  attr_accessor :id, :user_id, :question_id

  def self.find_by_id(id)
    like = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        likes
      WHERE
        id = ?
    SQL
    return nil unless like.length > 0

    Likes.new(like.first)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end




##FOLLOWS




class Follows
  attr_accessor :id, :user_id, :question_id

  def self.find_by_id(id)
    follow = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        follows
      WHERE
        id = ?
    SQL
    return nil unless follow.length > 0

   Follows.new(follow.first)
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        DISTINCT users.id
      FROM
        users
      JOIN
        follows ON users.id = follows.user_id
      WHERE
        follows.question_id = ?
    SQL
 
    followers.map { |hash| Users.find_by_id(hash["id"]) } 
  end

  def self.followed_questions_for_user_id(user_id)
    followed = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        DISTINCT questions.id
      FROM
        questions
      JOIN
        follows ON questions.id = follows.question_id
      WHERE
        follows.user_id = ?
    SQL
 
    followed.map { |hash| Questions.find_by_id(hash["id"]) } 
  end

  def initialize(options)
    @id = options['id']    
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end




##REPLIES




class Replies
  attr_accessor :id, :body, :parent_id, :question_id, :user_id

  def self.find_by_id(id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Replies.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless reply.length > 0

    reply.each { |rply| Replies.new(rply) } 
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0

    reply.each { |rply| Replies.new(rply) } 
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
  end

  def author
    author = QuestionsDBConnection.instance.execute(<<-SQL, @user_id)
      SELECT
        replies.user_id
      FROM
        replies
      WHERE
        replies.user_id = ?
    SQL
    Users.find_by_id(author.first["user_id"])
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Replies.find_by_id(@parent_id)
  end

  def child_replies
    replies = QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *  
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return nil unless replies.length > 0
    
    replies.each { |rply| Replies.new(rply) } 
  end
  
end