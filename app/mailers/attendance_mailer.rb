class AttendanceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.attendance_mailer.attendances_confirmation.subject
  #
  def attendances_confirmation(attendances, user)
    @greeting = "Hi"
    @attendances = attendances
    @user = user
    @attendance = @attendances.first

    mail to: user.email, subject: "Confirmación de registro de asistencia"
  end
end
