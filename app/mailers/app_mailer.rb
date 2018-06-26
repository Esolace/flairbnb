class AppMailer < ActionMailer::Base

    def new_reservation(room, reservation)
        @user = User.find(room.user_id)
        @reservation = reservation
        @room = room
        mail(from: 'flairbnb <no-reply@flairbnb.com>', to: @user.email, subject: "New Reservation!")
    end
end