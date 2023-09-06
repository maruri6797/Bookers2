class UserMailer < ApplicationMailer
  def send_notification(member, event)
    @group = event[:group]
    @title = event[:title]
    @body = event[:body]

    @mail = UserMailer.new()
    mail(
      to: member.email,
      subject: 'New Event Notice!'
      )
  end

  def self.send_notifications_to_group(event)
    group = event[:group]
    group.group_members.each do |member|
      UserMailer.send_notification(member, event).deliver_now
    end
  end
end
