# テーブル設計

## usersテーブル

|Column             |Type    |Options     |
|-------------------|--------|------------|
|nickname           |string  |null: false | 
|email              |string  |null: false |
|encrypted_password |string  |null: false |
|profile            |text    |            |

## Association