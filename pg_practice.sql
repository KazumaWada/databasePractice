-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。

CREATE DATABASE practice;

-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
\c practice

CREATE TYPE gender AS ENUM('Man', 'Woman', 'Other');

CREATE TABLE users(
 id SERIAL PRIMARY KEY,
 name char(255) NOT NULL,
 age int NOT NULL DEFAULT 0,
 gender gender NOT NULL DEFAULT 'Other'
);

COMMENT ON COLUMN users.name IS '氏名';
COMMENT ON COLUMN users.age IS '年齢';
COMMENT ON COLUMN users.gender IS '性別';


-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
CREATE TABLE jobs(
 id SERIAL PRIMARY KEY,
 user_id int NOT NULL,
 name char(255) NOT NULL DEFAULT '会社員',
 fk_user_id REFERENCES users(id)
)

COMMENT ON COLUMN jobs.name IS '仕事名'

