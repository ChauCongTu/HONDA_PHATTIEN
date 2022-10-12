CREATE TABLE KHACHHANG(
	MAKH NVARCHAR(20) NOT NULL PRIMARY KEY,
	TENKH NVARCHAR(50) NOT NULL,
	DIACHI NVARCHAR(500) NOT NULL,
	SDT CHAR(11) NOT NULL,
	CMND INT NOT NULL
);
CREATE TABLE CHINHANH(
	MACN NVARCHAR(20) NOT NULL PRIMARY KEY,
	TENCN NVARCHAR(100) NOT NULL,
	DIACHI NVARCHAR(500) NOT NULL,
	SDT CHAR(11) NOT NULL
);
CREATE TABLE NHANVIEN(
	MANV NVARCHAR(20) NOT NULL PRIMARY KEY,
	HOTEN NVARCHAR(50) NOT NULL,
	TENDANGNHAP NVARCHAR(20) NOT NULL,
	MATKHAU CHAR(32) NOT NULL,
	NGSINH DATE NOT NULL,
	SOCMND INT NOT NULL,
	DIACHI NVARCHAR(500) NOT NULL,
	QUYEN INT NOT NULL,
	SDT CHAR(11) NOT NULL,
	MACN NVARCHAR(20) NOT NULL,
    
    FOREIGN KEY (MACN) REFERENCES CHINHANH(MACN)
);
CREATE TABLE SANPHAM(
    MASP NVARCHAR(20) NOT NULL PRIMARY KEY,
	TENSP NVARCHAR(50) NOT NULL,
	DONGIA MONEY NOT NULL,
	MACN NVARCHAR(20) NOT NULL,
	DVT NVARCHAR(10) NOT NULL,
    
    FOREIGN KEY(MACN) REFERENCES CHINHANH(MACN)
);
CREATE TABLE HOADONXUAT(
	SOHDXUAT NVARCHAR(20) NOT NULL PRIMARY KEY,
	MANV NVARCHAR(20) NOT NULL,
	MAKH NVARCHAR(20) NOT NULL,
	NGHD DATE NOT NULL,
    
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
 );
 CREATE TABLE CTHDXUAT(
    SOHDXUAT NVARCHAR(20) NOT NULL,
	SOLUONG INT NOT NULL,
	MASP NVARCHAR(20) NOT NULL,
	THANHTIEN MONEY,
     
    PRIMARY KEY(SOHDXUAT, MASP),
    FOREIGN KEY (SOHDXUAT) REFERENCES HOADONXUAT(SOHDXUAT),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
 );
 CREATE TABLE NHACUNGCAP(
    MANCC NVARCHAR(20) NOT NULL PRIMARY KEY,
	TENNCC NVARCHAR(100) NOT NULL,
	DIACHI NVARCHAR(500) NOT NULL,
	SDT INT NOT NULL,
	EMAIL VARCHAR(50) NOT NULL
 );
 CREATE TABLE HOADONNHAP(
	SOHDNHAP NVARCHAR(20) NOT NULL PRIMARY KEY,
	MANV NVARCHAR(20) NOT NULL,
	MANCC NVARCHAR(20) NOT NULL,
	NGHD DATE NOT NULL,
    
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP(MANCC)
 );
 CREATE TABLE CTHDNHAP(
    SOHDNHAP NVARCHAR(20) NOT NULL,
	SOLUONG INT NOT NULL,
	MASP NVARCHAR(20) NOT NULL,
	THANHTIEN MONEY,
     
    PRIMARY KEY(SOHDNHAP, MASP),
    FOREIGN KEY (SOHDNHAP) REFERENCES HOADONNHAP(SOHDNHAP),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
 );
 CREATE TABLE LOAIXE(
    MALOAI NVARCHAR(20) NOT NULL PRIMARY KEY,
	TENLOAI NVARCHAR(30) NOT NULL   
 );
 CREATE TABLE XE(
    MAXE NVARCHAR(20) NOT NULL PRIMARY KEY,
	SOKHUNG NVARCHAR(17) NOT NULL,
	KHOILUONG FLOAT NOT NULL,
	DUNGTICHBX FLOAT NOT NULL,
	LOAIDC NVARCHAR(100) NOT NULL,
	DUNGTICHXL FLOAT NOT NULL,
	PITTONG NVARCHAR(100) NOT NULL,
	TYSONEN CHAR(20) NOT NULL,
	CONGSUATMAX NVARCHAR(100) NOT NULL,
	DUNGTICHNHOT NVARCHAR(100) NOT NULL,
	TRUYENDONG NVARCHAR(100) NOT NULL,
	HTKHOIDONG NVARCHAR(100) NOT NULL,
	MASP NVARCHAR(20) NOT NULL,
	MALOAI NVARCHAR(20) NOT NULL,
     
    FOREIGN KEY (MALOAI) REFERENCES LOAIXE(MALOAI),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
 );
CREATE TABLE PHUTUNG(
    MAPT NVARCHAR(20) NOT NULL PRIMARY KEY,
	MOTA  NVARCHAR(500) NOT NULL,
	MASP  NVARCHAR(20) NOT NULL,
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);
-- Thêm dữ liệu Khách hàng
INSERT INTO KHACHHANG VALUES('KHA0410K002', N'Châu Quế Nhơn', N'An Nhơn - Bình Định', '0848611127', '541272158');
INSERT INTO KHACHHANG VALUES('KHA0410K003', N'Nguyễn Văn A', N'Thủ Đức - Hồ Chí Minh', '0909232357', '541272159');
INSERT INTO KHACHHANG VALUES('KHA0410K004', N'Nguyễn Văn B', N'Thủ Đức - Hồ Chí Minh', '0332786855', '541272160');
INSERT INTO KHACHHANG VALUES('KHA0410K005', N'Nguyễn Văn C', N'Thủ Đức - Hồ Chí Minh', '0978564321', '541272161');
INSERT INTO KHACHHANG VALUES('KHA0410K006', N'Võ Văn Trọng', N'Tân An - Long An', '0335647382', '541272162');
INSERT INTO KHACHHANG VALUES('KHA0410K007', N'Võ Khắc Mạnh', N'Vũng Tàu', '0321456999', '541272163');
INSERT INTO KHACHHANG VALUES('KHA0410K008', N'Bùi Nhật Huy', N'Biên Hoà', '0999233521', '541272164');
INSERT INTO KHACHHANG VALUES('KHA0410K009', N'Lê Thanh Nhân', N'Bình Thạnh - Hồ Chí Minh', '0332654388', '541272165');
INSERT INTO KHACHHANG VALUES('KHA0410K010', N'Lưu Nhật Thành', N'An Nhơn - Bình Định', '0377546377', '541272166');
INSERT INTO KHACHHANG VALUES('KHA0410K011', N'Nguyễn Hữu Danh', N'Tân An - Long An', '0568443291', '541272167');

-- Thêm dữ liệu chi nhánh
INSERT INTO CHINHANH VALUES('CNH0909H001', N'HEAD Phát Tiến - Nơ Trang Long', N'17 Nơ Trang Long, P.7 , Q.Bình Thạnh', '0283803071');
INSERT INTO CHINHANH VALUES('CNH0909H002', N'HEAD Phát Tiến - Bến Lức', N'29 Quốc Lộ 1A, Bến Lức, Long An', '02723634224');
INSERT INTO CHINHANH VALUES('CNH0909H003', N'HEAD Phát Tiến - Khánh Hội', N'257-259 Khánh Hội, P.5 Q.4', '02839414931');
INSERT INTO CHINHANH VALUES('CNH0909H004', N'HEAD Phát Tiến - Lê Trọng Tấn', N'406A Lê Trọng Tấn, Q.Tân Phú', '02838165130');
INSERT INTO CHINHANH VALUES('CNH0909H005', N'HEAD Phát Tiến - Hàng Xanh', N'245 Xô Viết Nghệ Tĩnh, P.17, Q.Bình Thạnh', '02835106666');
INSERT INTO CHINHANH VALUES('CNH0909H006', N'HEAD Phát Tiến - Tân An', N'138 QL62, Phường 2, Tp. Tân An, Long An', '02723647111');

-- Thêm dữ liệu nhân viên
INSERT INTO NHANVIEN VALUES('NV51N001', N'Ê Linh Hà Lan', 'Haaland09', 'E10ADC3949BA59ABBE56E057F20F883E', '2000/10/04', '782678192', 'Manchester - England', '3', '0123987654', 'CNH0909H001');
INSERT INTO NHANVIEN VALUES('NV51N002', N'Nguyễn Thị Bảnh', 'Banh123', 'E10ADC3949BA59ABBE56E057F20F883E', '2005/12/03', '782678131', N'Nghệ An', '3', '0123987623', 'CNH0909H001');
INSERT INTO NHANVIEN VALUES('NV51N003', N'Nguyễn Thị Tỏn', 'Ton123', 'E10ADC3949BA59ABBE56E057F20F883E', '2001/03/08', '782678233', N'Đồng Tháp', '2', '0123987455', 'CNH0909H002');
INSERT INTO NHANVIEN VALUES('NV51N004', N'Nguyễn Thị Nụ', 'Nu147', 'E10ADC3949BA59ABBE56E057F20F883E', '1998/10/24', '782678785', N'Cà Mau', '1', '0123987899', 'CNH0909H003');
INSERT INTO NHANVIEN VALUES('NV51N005', N'Lê Dương Bảo Lâm', 'Lamdeptrai', 'E10ADC3949BA59ABBE56E057F20F883E', '1995/09/02', '782678099', N'Lâm Đồng', '2', '0123987144', 'CNH0909H003');
INSERT INTO NHANVIEN VALUES('NV51N006', N'Trấn Thành', 'Thanhmc', 'E10ADC3949BA59ABBE56E057F20F883E', '1989/08/23', '782678023', N'Hồ Chí Minh', '1', '0123987175', 'CNH0909H004');
INSERT INTO NHANVIEN VALUES('NV51N007', N'Lâm Đình Khoa', 'KhoaManDo', 'E10ADC3949BA59ABBE56E057F20F883E', '1996/06/01', '782678322', N'Đồng Tháp', '3', '0123987999', 'CNH0909H005');
INSERT INTO NHANVIEN VALUES('NV51N008', N'Nguyễn Hữu Nam', 'Huunam', 'E10ADC3949BA59ABBE56E057F20F883E', '1992/12/03', '782678112', N'Bạc Liêu', '2', '0123987333', 'CNH0909H005');
INSERT INTO NHANVIEN VALUES('NV51N009', N'Trần Thị Hết', 'Het123', 'E10ADC3949BA59ABBE56E057F20F883E', '1989/12/31', '782678100', N'Sóc Trăng', '1', '0123987222', 'CNH0909H006');
INSERT INTO NHANVIEN VALUES('NV51N010', N'Trần Văn Riêng', 'Reng990', 'E10ADC3949BA59ABBE56E057F20F883E', '1992/10/03', '782678000', N'Gia Lai', '2', '0123987123', 'CNH0909H006');

-- Thêm dữ liệu sản phẩm
INSERT INTO SANPHAM VALUES('SP010001', N'CBR150R - Đen xám', '123990000', 'CNH0909H001', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010002', N'CBR3000R - Đỏ', '576840000', 'CNH0909H003', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010003', N'CBR250R - Xanh', '104930000', 'CNH0909H003', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010004', N'CBR1000R - Trắng', '785640000', 'CNH0909H002', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010005', N'CBR1000RR - Đen', '1005760000', 'CNH0909H004', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010006', N'CBR600R - Đỏ xanh', '2348570000', 'CNH0909H004', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010007', N'CBR150R - Xanh đỏ', '123990000', 'CNH0909H005', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010008', N'Wave Alpha - Trắng đen', '17790000', 'CNH0909H005', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010009', N'DREAM Thái - Đen trắng', '19000000', 'CNH0909H006', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010010', N'AIR BLADE - Đỏ đen', '45000000', 'CNH0909H006', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010011', N'AIR BLADE - Xanh đen', '45000000', 'CNH0909H005', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010012', N'SH MODE - Trắng xanh', '67000000', 'CNH0909H001', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010013', N'SH 150i- Trắng', '105000000', 'CNH0909H003', N'CHIẾC');
INSERT INTO SANPHAM VALUES('SP010014', N'SH 150i- Đen', '105000000', 'CNH0909H005', N'CHIẾC');
INSERT INTO SANPHAM VALUES('PT010001', N'Tấm lọc gió', '64000', 'CNH0909H003' , N'Tấm');
INSERT INTO SANPHAM VALUES('PT010002', N'Bugi', '57200', 'CNH0909H003' , N'Cái');
INSERT INTO SANPHAM VALUES('PT010003', N'Bộ má phanh', '66000', 'CNH0909H005' , N'Bộ');
INSERT INTO SANPHAM VALUES('PT010004', N'Bộ má phanh dầu', '132000', 'CNH0909H001' , N'Bộ');
INSERT INTO SANPHAM VALUES('PT010005', N'Lốp xe', '290000', 'CNH0909H005' , N'Cái')

-- Thêm sữ liệu loại xe
INSERT INTO LOAIXE VALUES('PKL001', N'Xe côn tay');
INSERT INTO LOAIXE VALUES('PKL002', N'Xe số');
INSERT INTO LOAIXE VALUES('PKL003', N'Xe tay ga');

--Thêm dữ liệu xe
INSERT INTO XE VALUES('SP00CT001', '1H7AF9SX6D0100613', '139', '12', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, côn 6 số, làm mát bằng dung dịch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vòng/phút', N'1,1 lít khi thay nhớt. 1,3 lít khi rã máy', N'Cơ khí', N'Điện', 'SP010001', 'PKL001');
INSERT INTO XE VALUES('SP00CT0010', '1H7AF9SX6D0100614', '111', '7.8', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, tay ga, làm mát bằng dung dịch', '125', '53,5 mm x 55,5 mm', '11,5:1', N'8,75kW/8.500 vòng/phút', N'0,9 lít khi thay nhớt. 1,1 lít khi rã máy', N'Đai', N'Điện', 'SP010010', 'PKL003');
INSERT INTO XE VALUES('SP00CT0013', '1H7AF9SX6D0100615', '134', '7.8', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, tay ga, làm mát bằng dung dịch', '125', '57,3 mm x 57,8 mm', '11,5:1', N'9kW/8.500 vòng/phút', N'0,9 lít khi thay nhớt. 1,1 lít khi rã máy', N'Đai', N'Điện', 'SP010013', 'PKL003');
INSERT INTO XE VALUES('SP00CT009', '1H7AF9SX6D0100616', '99', '3.7', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, số, làm mát bằng không khí', '110', '48,5 mm x 50,2 mm', '9,5:1', N'8,54kW/7.500 vòng/phút', N'0,7 lít khi thay nhớt. 0,9 lít khi rã máy', N'Cơ khí', N'Điện', 'SP010009', 'PKL002');
INSERT INTO XE VALUES('SP00CT008', '1H7AF9SX6D0100617', '97', '3.7', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, số, làm mát bằng khong khí', '110', '48,5 mm x 50,2 mm', '9,5:1', N'8,2kW/7.500 vòng/phút', N'0,7 lít khi thay nhớt. 0,9 lít khi rã máy', N'Cơ khí', N'Điện', 'SP010008', 'PKL002');
INSERT INTO XE VALUES('SP00CT006', '1H7AF9SX6D0100618', '319', '12', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, côn 6 số, làm mát bằng dung dịch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vòng/phút', N'1,1 lít khi thay nhớt. 1,3 lít khi rã máy', N'Cơ khí', N'Điện', 'SP010006', 'PKL001');
INSERT INTO XE VALUES('SP00CT007', '1H7AF9SX6D0100619', '319', '12', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, côn 6 số, làm mát bằng dung dịch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vòng/phút', N'1,1 lít khi thay nhớt. 1,3 lít khi rã máy', N'Cơ khí', N'Điện', 'SP010007', 'PKL001');
INSERT INTO XE VALUES('SP00CT005', '1H7AF9SX6D0100620', '319', '12', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, côn 6 số, làm mát bằng dung dịch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vòng/phút', N'1,1 lít khi thay nhớt. 1,3 lít khi rã máy', N'Cơ khí', N'Điện', 'SP010008', 'PKL001');
INSERT INTO XE VALUES('SP00CT009', '1H7AF9SX6D0100621', '139', '12', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, côn 6 số, làm mát bằng dung dịch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vòng/phút', N'1,1 lít khi thay nhớt. 1,3 lít khi rã máy', N'Cơ khí', N'Điện', 'SP010009', 'PKL001');
INSERT INTO XE VALUES('SP00CT011', '1H7AF9SX6D0100622', '139', '12', N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, côn 6 số, làm mát bằng dung dịch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vòng/phút', N'1,1 lít khi thay nhớt. 1,3 lít khi rã máy', N'Cơ khí', N'Điện', 'SP010010', 'PKL001');


--Thêm dữ liệu nhà cung cấp
INSERT INTO NHACUNGCAP VALUES('HONDA1382', N'Honda Việt Nam', N'Phường Phúc Thắng, Thị xã Phúc Yên, Vĩnh Phúc', '0964807188', 'tonvinhgiatrithuc@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1383', N'Honda Việt Nam', N'736 Cách Mạng Tháng 8, P.5, Q.Tân Bình', '0964807122', 'hondaphattientanbinh@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1384', N'Honda Việt Nam', N'257-259 Khánh Hội, P.5 Q.4', '0964807122', 'hondaphattienkhanhhoi@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1385', N'Honda Việt Nam', N'245 Xô Viết Nghệ Tĩnh, P.17, Q.Bình Thạnh', '0964807123', 'hondaphattienbinhthanh@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1386', N'Honda Việt Nam', N'138 QL62, Phường 2, Tp. Tân An, Long An', '0964807100', 'hondaphattientanan@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1387', N'Honda Việt Nam', N'799 Kha Vạn Cân, Thủ Đức, HCM', '09648098745', 'hondaphattienthuduc@gmail.com');


--Thêm dữ liệu hóa đơn nhập
INSERT INTO HOADONNHAP VALUES('HD47X0100', 'NV51N001', 'HONDA1382', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0101', 'NV51N004', 'HONDA1387', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0102', 'NV51N003', 'HONDA1384', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0103', 'NV51N005', 'HONDA1384', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0104', 'NV51N001', 'HONDA1383', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0105', 'NV51N002', 'HONDA1382', '2022/02/10');

--Thêm dữ liệu chi tiết hóa đơn nhập
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010001');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010002');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010003');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010004');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010005');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010006');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010007');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010008');


--Thêm dữ liệu hóa đơn xuất
INSERT INTO HOADONXUAT VALUES('HD47X0100', 'NV51N001', 'KHA0410K002', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0101', 'NV51N004', 'KHA0410K003', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0102', 'NV51N003', 'KHA0410K004', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0103', 'NV51N005', 'KHA0410K005', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0104', 'NV51N001', 'KHA0410K006', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0105', 'NV51N002', 'KHA0410K007', '2022/05/10');

--Thêm dữ liệu chi tiết hóa đơn xuất
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010001');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010002');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010003');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010004');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010005');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010006');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010007');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010008');
