class NewAnswerMailer < ActionMailer::Base
  default from: "new_answer@mathtous.com"

  def get_new_answer(user)
    @user = user
    @url = "mathtous.com/answers"
    mail(to: "stoyanovd@mail.ru", subject: "New answer on MathToUs")
  end
end
