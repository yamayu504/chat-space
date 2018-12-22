# README

## membersテーブル

|column|Type|Options|
|-----|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

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
- has_many: messages

## groupsテーブル

|column|Type|Options|
|-----|----|-------|
|group_name|string|null:false|

### Association

- has_many: menbers
- has_many: users, through: menbers
- has_many: messages

## messagesテーブル

|column|Type|Options|
|-----|----|-------|
|mesage|string|null:false|
|image|string||
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: group
