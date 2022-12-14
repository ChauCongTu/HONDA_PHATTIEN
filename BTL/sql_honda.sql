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
-- Th??m d??? li???u Kh??ch h??ng
INSERT INTO KHACHHANG VALUES('KHA0410K002', N'Ch??u Qu??? Nh??n', N'An Nh??n - B??nh ?????nh', '0848611127', '541272158');
INSERT INTO KHACHHANG VALUES('KHA0410K003', N'Nguy???n V??n A', N'Th??? ?????c - H??? Ch?? Minh', '0909232357', '541272159');
INSERT INTO KHACHHANG VALUES('KHA0410K004', N'Nguy???n V??n B', N'Th??? ?????c - H??? Ch?? Minh', '0332786855', '541272160');
INSERT INTO KHACHHANG VALUES('KHA0410K005', N'Nguy???n V??n C', N'Th??? ?????c - H??? Ch?? Minh', '0978564321', '541272161');
INSERT INTO KHACHHANG VALUES('KHA0410K006', N'V?? V??n Tr???ng', N'T??n An - Long An', '0335647382', '541272162');
INSERT INTO KHACHHANG VALUES('KHA0410K007', N'V?? Kh???c M???nh', N'V??ng T??u', '0321456999', '541272163');
INSERT INTO KHACHHANG VALUES('KHA0410K008', N'B??i Nh???t Huy', N'Bi??n Ho??', '0999233521', '541272164');
INSERT INTO KHACHHANG VALUES('KHA0410K009', N'L?? Thanh Nh??n', N'B??nh Th???nh - H??? Ch?? Minh', '0332654388', '541272165');
INSERT INTO KHACHHANG VALUES('KHA0410K010', N'L??u Nh???t Th??nh', N'An Nh??n - B??nh ?????nh', '0377546377', '541272166');
INSERT INTO KHACHHANG VALUES('KHA0410K011', N'Nguy???n H???u Danh', N'T??n An - Long An', '0568443291', '541272167');

-- Th??m d??? li???u chi nh??nh
INSERT INTO CHINHANH VALUES('CNH0909H001', N'HEAD Ph??t Ti???n - N?? Trang Long', N'17 N?? Trang Long, P.7 , Q.B??nh Th???nh', '0283803071');
INSERT INTO CHINHANH VALUES('CNH0909H002', N'HEAD Ph??t Ti???n - B???n L???c', N'29 Qu???c L??? 1A, B???n L???c, Long An', '02723634224');
INSERT INTO CHINHANH VALUES('CNH0909H003', N'HEAD Ph??t Ti???n - Kh??nh H???i', N'257-259 Kh??nh H???i, P.5 Q.4', '02839414931');
INSERT INTO CHINHANH VALUES('CNH0909H004', N'HEAD Ph??t Ti???n - L?? Tr???ng T???n', N'406A L?? Tr???ng T???n, Q.T??n Ph??', '02838165130');
INSERT INTO CHINHANH VALUES('CNH0909H005', N'HEAD Ph??t Ti???n - H??ng Xanh', N'245 X?? Vi???t Ngh??? T??nh, P.17, Q.B??nh Th???nh', '02835106666');
INSERT INTO CHINHANH VALUES('CNH0909H006', N'HEAD Ph??t Ti???n - T??n An', N'138 QL62, Ph?????ng 2, Tp. T??n An, Long An', '02723647111');

-- Th??m d??? li???u nh??n vi??n
INSERT INTO NHANVIEN VALUES('NV51N001', N'?? Linh H?? Lan', 'Haaland09', 'E10ADC3949BA59ABBE56E057F20F883E', '2000/10/04', '782678192', 'Manchester - England', '3', '0123987654', 'CNH0909H001');
INSERT INTO NHANVIEN VALUES('NV51N002', N'Nguy???n Th??? B???nh', 'Banh123', 'E10ADC3949BA59ABBE56E057F20F883E', '2005/12/03', '782678131', N'Ngh??? An', '3', '0123987623', 'CNH0909H001');
INSERT INTO NHANVIEN VALUES('NV51N003', N'Nguy???n Th??? T???n', 'Ton123', 'E10ADC3949BA59ABBE56E057F20F883E', '2001/03/08', '782678233', N'?????ng Th??p', '2', '0123987455', 'CNH0909H002');
INSERT INTO NHANVIEN VALUES('NV51N004', N'Nguy???n Th??? N???', 'Nu147', 'E10ADC3949BA59ABBE56E057F20F883E', '1998/10/24', '782678785', N'C?? Mau', '1', '0123987899', 'CNH0909H003');
INSERT INTO NHANVIEN VALUES('NV51N005', N'L?? D????ng B???o L??m', 'Lamdeptrai', 'E10ADC3949BA59ABBE56E057F20F883E', '1995/09/02', '782678099', N'L??m ?????ng', '2', '0123987144', 'CNH0909H003');
INSERT INTO NHANVIEN VALUES('NV51N006', N'Tr???n Th??nh', 'Thanhmc', 'E10ADC3949BA59ABBE56E057F20F883E', '1989/08/23', '782678023', N'H??? Ch?? Minh', '1', '0123987175', 'CNH0909H004');
INSERT INTO NHANVIEN VALUES('NV51N007', N'L??m ????nh Khoa', 'KhoaManDo', 'E10ADC3949BA59ABBE56E057F20F883E', '1996/06/01', '782678322', N'?????ng Th??p', '3', '0123987999', 'CNH0909H005');
INSERT INTO NHANVIEN VALUES('NV51N008', N'Nguy???n H???u Nam', 'Huunam', 'E10ADC3949BA59ABBE56E057F20F883E', '1992/12/03', '782678112', N'B???c Li??u', '2', '0123987333', 'CNH0909H005');
INSERT INTO NHANVIEN VALUES('NV51N009', N'Tr???n Th??? H???t', 'Het123', 'E10ADC3949BA59ABBE56E057F20F883E', '1989/12/31', '782678100', N'S??c Tr??ng', '1', '0123987222', 'CNH0909H006');
INSERT INTO NHANVIEN VALUES('NV51N010', N'Tr???n V??n Ri??ng', 'Reng990', 'E10ADC3949BA59ABBE56E057F20F883E', '1992/10/03', '782678000', N'Gia Lai', '2', '0123987123', 'CNH0909H006');

-- Th??m d??? li???u s???n ph???m
INSERT INTO SANPHAM VALUES('SP010001', N'CBR150R - ??en x??m', '123990000', 'CNH0909H001', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010002', N'CBR3000R - ?????', '576840000', 'CNH0909H003', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010003', N'CBR250R - Xanh', '104930000', 'CNH0909H003', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010004', N'CBR1000R - Tr???ng', '785640000', 'CNH0909H002', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010005', N'CBR1000RR - ??en', '1005760000', 'CNH0909H004', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010006', N'CBR600R - ????? xanh', '2348570000', 'CNH0909H004', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010007', N'CBR150R - Xanh ?????', '123990000', 'CNH0909H005', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010008', N'Wave Alpha - Tr???ng ??en', '17790000', 'CNH0909H005', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010009', N'DREAM Th??i - ??en tr???ng', '19000000', 'CNH0909H006', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010010', N'AIR BLADE - ????? ??en', '45000000', 'CNH0909H006', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010011', N'AIR BLADE - Xanh ??en', '45000000', 'CNH0909H005', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010012', N'SH MODE - Tr???ng xanh', '67000000', 'CNH0909H001', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010013', N'SH 150i- Tr???ng', '105000000', 'CNH0909H003', N'CHI???C');
INSERT INTO SANPHAM VALUES('SP010014', N'SH 150i- ??en', '105000000', 'CNH0909H005', N'CHI???C');
INSERT INTO SANPHAM VALUES('PT010001', N'T???m l???c gi??', '64000', 'CNH0909H003' , N'T???m');
INSERT INTO SANPHAM VALUES('PT010002', N'Bugi', '57200', 'CNH0909H003' , N'C??i');
INSERT INTO SANPHAM VALUES('PT010003', N'B??? m?? phanh', '66000', 'CNH0909H005' , N'B???');
INSERT INTO SANPHAM VALUES('PT010004', N'B??? m?? phanh d???u', '132000', 'CNH0909H001' , N'B???');
INSERT INTO SANPHAM VALUES('PT010005', N'L???p xe', '290000', 'CNH0909H005' , N'C??i')

-- Th??m s??? li???u lo???i xe
INSERT INTO LOAIXE VALUES('PKL001', N'Xe c??n tay');
INSERT INTO LOAIXE VALUES('PKL002', N'Xe s???');
INSERT INTO LOAIXE VALUES('PKL003', N'Xe tay ga');

--Th??m d??? li???u xe
INSERT INTO XE VALUES('SP00CT001', '1H7AF9SX6D0100613', '139', '12', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, c??n 6 s???, l??m m??t b???ng dung di??ch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vo??ng/phu??t', N'1,1 l??t khi thay nh???t. 1,3 l??t khi r?? m??y', N'C?? kh??', N'??i???n', 'SP010001', 'PKL001');
INSERT INTO XE VALUES('SP00CT0010', '1H7AF9SX6D0100614', '111', '7.8', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, tay ga, l??m m??t b???ng dung di??ch', '125', '53,5 mm x 55,5 mm', '11,5:1', N'8,75kW/8.500 vo??ng/phu??t', N'0,9 l??t khi thay nh???t. 1,1 l??t khi r?? m??y', N'??ai', N'??i???n', 'SP010010', 'PKL003');
INSERT INTO XE VALUES('SP00CT0013', '1H7AF9SX6D0100615', '134', '7.8', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, tay ga, l??m m??t b???ng dung di??ch', '125', '57,3 mm x 57,8 mm', '11,5:1', N'9kW/8.500 vo??ng/phu??t', N'0,9 l??t khi thay nh???t. 1,1 l??t khi r?? m??y', N'??ai', N'??i???n', 'SP010013', 'PKL003');
INSERT INTO XE VALUES('SP00CT009', '1H7AF9SX6D0100616', '99', '3.7', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, s???, l??m m??t b???ng kh??ng kh??', '110', '48,5 mm x 50,2 mm', '9,5:1', N'8,54kW/7.500 vo??ng/phu??t', N'0,7 l??t khi thay nh???t. 0,9 l??t khi r?? m??y', N'C?? kh??', N'??i???n', 'SP010009', 'PKL002');
INSERT INTO XE VALUES('SP00CT008', '1H7AF9SX6D0100617', '97', '3.7', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, s???, l??m m??t b???ng khong kh??', '110', '48,5 mm x 50,2 mm', '9,5:1', N'8,2kW/7.500 vo??ng/phu??t', N'0,7 l??t khi thay nh???t. 0,9 l??t khi r?? m??y', N'C?? kh??', N'??i???n', 'SP010008', 'PKL002');
INSERT INTO XE VALUES('SP00CT006', '1H7AF9SX6D0100618', '319', '12', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, c??n 6 s???, l??m m??t b???ng dung di??ch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vo??ng/phu??t', N'1,1 l??t khi thay nh???t. 1,3 l??t khi r?? m??y', N'C?? kh??', N'??i???n', 'SP010006', 'PKL001');
INSERT INTO XE VALUES('SP00CT007', '1H7AF9SX6D0100619', '319', '12', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, c??n 6 s???, l??m m??t b???ng dung di??ch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vo??ng/phu??t', N'1,1 l??t khi thay nh???t. 1,3 l??t khi r?? m??y', N'C?? kh??', N'??i???n', 'SP010007', 'PKL001');
INSERT INTO XE VALUES('SP00CT005', '1H7AF9SX6D0100620', '319', '12', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, c??n 6 s???, l??m m??t b???ng dung di??ch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vo??ng/phu??t', N'1,1 l??t khi thay nh???t. 1,3 l??t khi r?? m??y', N'C?? kh??', N'??i???n', 'SP010008', 'PKL001');
INSERT INTO XE VALUES('SP00CT009', '1H7AF9SX6D0100621', '139', '12', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, c??n 6 s???, l??m m??t b???ng dung di??ch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vo??ng/phu??t', N'1,1 l??t khi thay nh???t. 1,3 l??t khi r?? m??y', N'C?? kh??', N'??i???n', 'SP010009', 'PKL001');
INSERT INTO XE VALUES('SP00CT011', '1H7AF9SX6D0100622', '139', '12', N'PGM-FI, 4 k???, DOHC, xy-lanh ????n, c??n 6 s???, l??m m??t b???ng dung di??ch', '149.2', '57,3 mm x 57,8 mm', '11,3:1', N'12,6kW/9.000 vo??ng/phu??t', N'1,1 l??t khi thay nh???t. 1,3 l??t khi r?? m??y', N'C?? kh??', N'??i???n', 'SP010010', 'PKL001');


--Th??m d??? li???u nh?? cung c???p
INSERT INTO NHACUNGCAP VALUES('HONDA1382', N'Honda Vi???t Nam', N'Ph?????ng Ph??c Th???ng, Th??? x?? Ph??c Y??n, V??nh Ph??c', '0964807188', 'tonvinhgiatrithuc@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1383', N'Honda Vi???t Nam', N'736 C??ch M???ng Th??ng 8, P.5, Q.T??n B??nh', '0964807122', 'hondaphattientanbinh@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1384', N'Honda Vi???t Nam', N'257-259 Kh??nh H???i, P.5 Q.4', '0964807122', 'hondaphattienkhanhhoi@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1385', N'Honda Vi???t Nam', N'245 X?? Vi???t Ngh??? T??nh, P.17, Q.B??nh Th???nh', '0964807123', 'hondaphattienbinhthanh@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1386', N'Honda Vi???t Nam', N'138 QL62, Ph?????ng 2, Tp. T??n An, Long An', '0964807100', 'hondaphattientanan@gmail.com');
INSERT INTO NHACUNGCAP VALUES('HONDA1387', N'Honda Vi???t Nam', N'799 Kha V???n C??n, Th??? ?????c, HCM', '09648098745', 'hondaphattienthuduc@gmail.com');


--Th??m d??? li???u h??a ????n nh???p
INSERT INTO HOADONNHAP VALUES('HD47X0100', 'NV51N001', 'HONDA1382', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0101', 'NV51N004', 'HONDA1387', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0102', 'NV51N003', 'HONDA1384', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0103', 'NV51N005', 'HONDA1384', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0104', 'NV51N001', 'HONDA1383', '2022/02/10');
INSERT INTO HOADONNHAP VALUES('HD47X0105', 'NV51N002', 'HONDA1382', '2022/02/10');

--Th??m d??? li???u chi ti???t h??a ????n nh???p
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010001');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010002');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010003');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010004');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010005');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010006');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010007');
INSERT INTO CTHDNHAP (SOHDNHAP, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010008');


--Th??m d??? li???u h??a ????n xu???t
INSERT INTO HOADONXUAT VALUES('HD47X0100', 'NV51N001', 'KHA0410K002', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0101', 'NV51N004', 'KHA0410K003', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0102', 'NV51N003', 'KHA0410K004', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0103', 'NV51N005', 'KHA0410K005', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0104', 'NV51N001', 'KHA0410K006', '2022/05/10');
INSERT INTO HOADONXUAT VALUES('HD47X0105', 'NV51N002', 'KHA0410K007', '2022/05/10');

--Th??m d??? li???u chi ti???t h??a ????n xu???t
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010001');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010002');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010003');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010004');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010005');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010006');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010007');
INSERT INTO CTHDXUAT(SOHDXUAT, SOLUONG, MASP) VALUES('HD47X0100', '1', 'SP010008');
-- Th??mLogin User
CREATE LOGIN NhonC
WITH PASSWORD = '123456', DEFAULT_DATABASE = QLXEMAY
CREATE USER QueNhon FOR LOGIN NhonC
CREATE LOGIN LuuThanh 
WITH PASSWORD = '123456', DEFAULT_DATABASE = QLXEMAY
CREATE USER LuuThanh
CREATE LOGIN KhacManh 
WITH PASSWORD = '123456', DEFAULT_DATABASE = QLXEMAY
CREATE USER KhacManh
CREATE LOGIN VanTrong
WITH PASSWORD = '123456', DEFAULT_DATABASE = QLXEMAY
CREATE USER VanTrong
CREATE LOGIN CaoAn
WITH PASSWORD = '123456', DEFAULT_DATABASE = QLXEMAY
CREATE USER CaoAn
