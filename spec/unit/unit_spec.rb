# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Announcement, type: :model do
	subject do
		described_class.new(title: 'plant attack', description: 'plants are attacking', posted_on: '3rd Feb 2021 04:05:06+03:30', user_id: 1, announcement_id: 1)
	end

	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end

	it 'is not valid without a title' do
		subject.title = nil
		expect(subject).not_to be_valid
	end

	it 'is valid without a description' do
		subject.description = nil
		expect(subject).to be_valid
	end

	it 'is not valid without a posted date' do
		subject.posted_on = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without an announcement id' do
		subject.announcement_id = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a user_id' do
		subject.user_id = nil
		expect(subject).not_to be_valid
	end
end

RSpec.describe Attendance, type: :model do
	subject do
		described_class.new(event_id: 1, user_id: 1, attend_time_start: 1, attend_time_end: 1)
	end

	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end

	it 'is not valid without an event id' do
		subject.event_id = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without an user id' do
		subject.user_id = nil
		expect(subject).not_to be_valid
	end

	it 'is valid without an attend time start' do
		subject.attend_time_start = nil
		expect(subject).to be_valid
	end

	it 'is valid without an attend time end' do
		subject.attend_time_end = nil
		expect(subject).to be_valid
	end
end

RSpec.describe Event, type: :model do
	subject do
		described_class.new(event_id: 1, title: 'joe dev world', description: 'welcome to joe dev world!', date: '2021-01-01')
	end

	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end

	it 'is not valid without an id' do
		subject.event_id = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a title' do
		subject.title = nil
		expect(subject).not_to be_valid
	end

	it 'is valid without a description' do
		subject.description = nil
		expect(subject).to be_valid
	end

	it 'is not valid without a date' do
		subject.date = nil
		expect(subject).not_to be_valid
	end
end

RSpec.describe Role, type: :model do
	subject do
		described_class.new(role_id: 1, is_officer: 1, is_admin: 1, title: 'la planta')
	end

	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end

	it 'is not valid without a role_id' do
		subject.role_id = nil
		expect(subject).not_to be_valid
	end

	it 'is valid without an is_officer' do
		subject.is_officer = nil
		expect(subject).to be_valid
	end

	it 'is valid without an is_admin' do
		subject.is_admin = nil
		expect(subject).to be_valid
	end

	it 'is valid without a title' do
		subject.title = nil
		expect(subject).to be_valid
	end
end

RSpec.describe User, type: :model do
	subject do
		described_class.new(email: 'user@tamu.edu', first_name: 'User', last_name: 'McUser', class_year: 1999)
	end

	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end

	it 'is not valid without an email' do
		subject.email = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a first name' do
		subject.first_name = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid with unapproved characters in first name' do
		subject.first_name = '420'
		expect(subject).not_to be_valid
	end

	it 'is not valid without a last name' do
		subject.last_name = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid with unapproved characters in last name' do
		subject.last_name = '69'
		expect(subject).not_to be_valid
	end

	it 'is not valid without class year' do
		subject.class_year = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid with class year less than 1876' do
		subject.class_year = 400
		expect(subject).not_to be_valid
	end
end