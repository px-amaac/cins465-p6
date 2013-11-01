# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
DigitalObjectIdentifier.delete_all
Url.delete_all
Comment.delete_all

@user1 = User.create!(:email => "user1@email.com", :password => "1234567890")
@user2 = User.create!(:email => "user2@email.com", :password => "0987654321")


10.times do |n|
	@doi1 = @user1.digital_object_identifiers.create!(:name => "#{n} name", :integer_identifier => n, :description => "this is a description")
	@doi2 = @user2.digital_object_identifiers.create!(:name => "#{n+20} name", :integer_identifier => n+21, :description => "this is a description")
	@url1 = @doi1.urls.create!(:url => "www.#{n}_#{@user1.email}")
	@url2 = @doi2.urls.create!(:url => "www.#{n}_#{@user2.email}")
	@comment1 = @doi1.comments.new(:comment => "This is a comment by  #{@user1.email}")
	@comment1.user_id = @user1.id
	@comment2 = @doi1.comments.new(:comment => "This is a comment by  #{@user2.email}")
	@comment2.user_id = @user2.id
	@comment3 = @doi2.comments.new(:comment => "This is a comment by  #{@user1.email}")
	@comment3.user_id = @user1.id
	@comment4 = @doi2.comments.new(:comment => "This is a comment by  #{@user2.email}")
	@comment4.user_id = @user2.id

	@comment1.save
	@comment2.save
	@comment3.save
	@comment4.save
end
