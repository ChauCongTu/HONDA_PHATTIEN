-- sp Thêm xe
exec sp_themXe 'Mã sản phẩm',
				'TENSP',
				'giá',
				'mã chi nhánh',
				'đơn vị',
				'mã xe',
				'số khung',
				'khối lượng',
				'dung tích bx',
				'động cơ',
				'dung tích xl',
				'PT',
				'TSN',
				'CSM',
				'DTN',
				'TD',
				'HTKD',
				'mã loại xe'
-- sp xem danh sách xe tại chi nhánh
exec sp_xemXeTheoChiNhanh 'Mã chi nhánh'
