# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## membersテーブル

|column|Type|Options|
|-----|----|-------|
|user_id|ingeger|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :group
- belongs_to :user

## usersテーブル

|column|Type|Options|
|-----|----|-------|
|user_name|string|null:false|
|email|string|null: false|
|password|string|null: false, minimum:8|

### Association

- has_many: members
- has_many: groups, through: menbers
- has_many: messages, through: menbers

## groupsテーブル

|column|Type|Options|
|-----|----|-------|
|group_name|string|null:false|

### Association

- has_many:menbers
- has_many:users, through: menbers
- has_many: messages, through: menbers

## messagesテーブル

|column|Type|Options|
|-----|----|-------|
|mesage|string|null:false|
|image|string||
|user_id|ingeger|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to: users
- belongs_to: messages
