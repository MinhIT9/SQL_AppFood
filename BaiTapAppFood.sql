CREATE DATABASE RestaurantDB;

USE RestaurantDB;

CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE restaurant (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(255),
    image VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE food_type (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(255)
);

CREATE TABLE food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    description VARCHAR(255),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE sub_food (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(255),
    sub_price FLOAT,
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    food_id INT,
    amount INT,
    code (VARCHAR(255)),
    arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE like_res (
    user_id INT,
    res_id INT,
    date_like DATETIME,
    PRIMARY KEY (user_id, res_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    PRIMARY KEY (user_id, res_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- Thêm dữ liệu ảo:
-- table user
INSERT INTO user (full_name, email, password) VALUES
('David Nguyen', 'David@gmail.com', 'abc'),
('Nguyen Van Long', 'Long@gmail.com', 'abc'),
('Shizuka Ngoc', 'Shizuka@gmail.com', 'abc'),
('Dang Phuc Minh', 'minhdang@gmail.com', 'abc'),
('Tran Thi Lien', 'Lientran@gmail.com', 'abc'),
('Le Van Chau', 'chauav@gmail.com', 'abc'),
('Pham Thi Dương', 'duonglo@gmail.com', 'abc'),
('Hoang Van Yen', 'yenhoang@gmail.com', 'abc'),
('Vo Thi Tuyet', 'tuyetd@gmail.com', 'abc'),
('Ngo Van Giang', 'giangacv@gmail.com', 'abc'),
('Do Thi Hanh', 'hanhca@gmail.com', 'abc'),
('Duong Van Tuan', 'tuanok@gmail.com', 'abc'),
('Truong Thi Linh', 'linhtrieun@gmail.com', 'abc');

-- Table restaurant
INSERT INTO restaurant (res_name, image, description) VALUES
('Nhà hàng A', 'image_a.jpg', 'Mô tả nhà hàng A'),
('Nhà hàng B', 'image_b.jpg', 'Mô tả nhà hàng B'),
('Nhà hàng C', 'image_c.jpg', 'Mô tả nhà hàng C'),
('Nhà hàng D', 'image_d.jpg', 'Mô tả nhà hàng D'),
('Nhà hàng E', 'image_e.jpg', 'Mô tả nhà hàng E'),
('Nhà hàng F', 'image_f.jpg', 'Mô tả nhà hàng F'),
('Nhà hàng G', 'image_g.jpg', 'Mô tả nhà hàng G'),
('Nhà hàng H', 'image_h.jpg', 'Mô tả nhà hàng H'),
('Nhà hàng I', 'image_i.jpg', 'Mô tả nhà hàng I'),
('Nhà hàng J', 'image_j.jpg', 'Mô tả nhà hàng J');

-- Table food_type
INSERT INTO food_type (type_name) VALUES
('Món khai vị'),
('Món chính'),
('Món tráng miệng'),
('Món ăn nhẹ'),
('Món chay'),
('Món nước'),
('Món thịt'),
('Món cá'),
('Món salad'),
('Món mì');

-- Table food
INSERT INTO food (food_name, image, price, description, type_id) VALUES
('Món ăn A', 'food_a.jpg', 100000, 'Mô tả món ăn A', 1),
('Món ăn B', 'food_b.jpg', 200000, 'Mô tả món ăn B', 2),
('Món ăn C', 'food_c.jpg', 150000, 'Mô tả món ăn C', 3),
('Món ăn D', 'food_d.jpg', 250000, 'Mô tả món ăn D', 4),
('Món ăn E', 'food_e.jpg', 300000, 'Mô tả món ăn E', 5),
('Món ăn F', 'food_f.jpg', 350000, 'Mô tả món ăn F', 6),
('Món ăn G', 'food_g.jpg', 400000, 'Mô tả món ăn G', 7),
('Món ăn H', 'food_h.jpg', 450000, 'Mô tả món ăn H', 8),
('Món ăn I', 'food_i.jpg', 500000, 'Mô tả món ăn I', 9),
('Món ăn J', 'food_j.jpg', 550000, 'Mô tả món ăn J', 10);

-- Table sub_food
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Phụ kiện A', 10000, 1),
('Phụ kiện B', 20000, 2),
('Phụ kiện C', 15000, 3),
('Phụ kiện D', 25000, 4),
('Phụ kiện E', 30000, 5),
('Phụ kiện F', 35000, 6),
('Phụ kiện G', 40000, 7),
('Phụ kiện H', 45000, 8),
('Phụ kiện I', 50000, 9),
('Phụ kiện J', 55000, 10);

-- Table order
INSERT INTO `order` (user_id, food_id, amount, arr_sub_id) VALUES
(1, 4, 2, '1,2'),
(1, 2, 1, '3,4'),
(1, 3, 4, '5,6'),
(2, 1, 2, '1,2'),
(2, 4, 1, '3,4'),
(3, 3, 4, '5,6'),

(1, 1, 2, '1,2'),
(2, 2, 1, '3,4'),
(3, 3, 4, '5,6'),
(4, 4, 3, '7,8'),
(5, 5, 5, '9,10'),
(6, 6, 2, '1,3'),
(7, 7, 1, '2,4'),
(8, 8, 3, '5,7'),
(9, 9, 2, '6,8'),
(10, 10, 4, '9,10');


-- Table like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(2, 1, '2024-01-01 12:00:00'),
(3, 1, '2024-01-01 12:00:00'),
(4, 1, '2024-01-01 12:00:00'),
(5, 1, '2024-01-01 12:00:00'),
(2, 3, '2024-01-01 12:00:00'),
(4, 3, '2024-01-01 12:00:00'),
(5, 3, '2024-01-01 12:00:00'),
(3, 4, '2024-01-01 12:00:00'),
(5, 4, '2024-01-01 12:00:00'),
(1, 1, '2024-01-01 12:00:00'),
(2, 2, '2024-01-02 13:00:00'),
(3, 3, '2024-01-03 14:00:00'),
(4, 4, '2024-01-04 15:00:00'),
(5, 5, '2024-01-05 16:00:00'),
(6, 6, '2024-01-06 17:00:00'),
(7, 7, '2024-01-07 18:00:00'),
(8, 8, '2024-01-08 19:00:00'),
(9, 9, '2024-01-09 20:00:00'),
(10, 10, '2024-01-10 21:00:00');

-- Table rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2024-01-01 12:00:00'),
(2, 2, 4, '2024-01-02 13:00:00'),
(3, 3, 3, '2024-01-03 14:00:00'),
(4, 4, 2, '2024-01-04 15:00:00'),
(5, 5, 1, '2024-01-05 16:00:00'),
(6, 6, 5, '2024-01-06 17:00:00'),
(7, 7, 4, '2024-01-07 18:00:00'),
(8, 8, 3, '2024-01-08 19:00:00'),
(9, 9, 2, '2024-01-09 20:00:00'),
(10, 10, 1, '2024-01-10 21:00:00');

-- =========== --

-- 1. Tìm 5 người đã like nhà hàng nhiều nhất:
SELECT u.user_id, u.full_name, u.email, COUNT(lr.res_id) AS like_count
FROM user u
INNER JOIN like_res lr ON u.user_id = lr.user_id
GROUP BY u.user_id
ORDER BY like_count DESC
LIMIT 5;

-- 2. Tìm 2 nhà hàng có lượt like nhiều nhất:
SELECT r.res_id, r.res_name, r.image, r.description, COUNT(lr.res_id) AS like_count
FROM restaurant r
INNER JOIN like_res lr ON r.res_id = lr.res_id
GROUP BY r.res_id
ORDER BY like_count DESC
LIMIT 2;

-- 3. Tìm người đã đặt hàng nhiều nhất:
SELECT u.user_id, u.full_name, u.email, COUNT(od.user_id) AS order_count
FROM user u
INNER JOIN `order` od ON u.user_id = od.user_id
GROUP BY u.user_id
ORDER BY order_count DESC
LIMIT 1;

-- 4. Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng):
SELECT u.user_id, u.full_name, u.email
FROM user u
LEFT JOIN `order` o ON u.user_id = o.user_id
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE o.order_id IS NULL AND lr.user_id IS NULL AND rr.user_id IS NULL;
