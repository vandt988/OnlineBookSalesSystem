
create table Role
(
	roleID int identity(1,1) PRIMARY KEY, 
	roleName nvarchar(255) NOT NULL,
) 

create table Account
(
	accountID int identity(1,1) PRIMARY KEY, 
	username varchar(255) unique NOT NULL,
	email varchar(255) NULL,
	phone varchar(20) NOT NULL,	
	address nvarchar(255),
	password varchar(255) NOT NULL,
	roleID int FOREIGN KEY REFERENCES Role(roleID)
)

create table Category
(
	categoryID int identity(1,1) PRIMARY KEY, 
	nameCategory nvarchar(255) NOT NULL
)

create table Product
(
	productID int identity(1,1) PRIMARY KEY, 
	nameProduct nvarchar(255) NOT NULL,
	price int NOT NULL,
	image varchar(255) NOT NULL,
	quantity int NOT NULL,
	description nvarchar(max),
	categoryID int FOREIGN KEY REFERENCES Category(categoryID)
)

create table [Order]
(
	orderID int identity(1,1) PRIMARY KEY, 
	accountID int FOREIGN KEY REFERENCES Account(accountID),
	fullname nvarchar(255) NOT NULL,
	email varchar(255),
	phone varchar(20) NOT NULL,
	address nvarchar(255),
	orderDate date,
	total int
)

create table OrderDetail
(
	orderDetailID int identity(1,1) PRIMARY KEY, 
	orderID int FOREIGN KEY REFERENCES [Order](orderID),
	productID int FOREIGN KEY REFERENCES Product(productID),
	price int,
	num int,
	amount int
)
 
INSERT INTO Role values ('admin'), ('user')

 INSERT INTO Account values ('vandt', 'dothivan@gmail.com', '0374268988', N'Bắc Ninh', 1805, 1),
							('khoidt', null, '0332242988', N'Hưng Yên', 2803, 2),
							('kvan', 'kvan@gmail.com', '0397767792', N'Hải Phòng', 2110, 2),
							('trang', 'trang@gmail.com', '0344030123', N'Hưng Yên', 2809, 2)

INSERT INTO Category VALUES  (N'Sách thiếu nhi'), 
							 (N'Sách kinh tế'), 
							 (N'Sách văn học'), 
							 (N'Sách thường thức - đời sống'), 
							 (N'Sách ngoại ngữ'),
							 (N'Sách giáo khoa - giáo trình')

 insert into Product values (N'Wolfoo Khám Phá Không Gian', 53000, 'images/1.jpg', 15, null, 1),
 							(N'Song Hành & Đối Thoại', 70000, 'images/12.jpg', 7, N'Bước vào quán văn của Hoàng Đăng Khoa, nhà văn, nhà phê bình chắc chắn sẽ ngồi lâu. Những câu hỏi của anh thường dài, sâu, gợi mở. Với tư cách chủ nhà, anh không thiết khách bằng những lời khen tặng dễ dãi, mà luôn cùng họ tranh biện, đẩy đến tận cùng các vấn đề của văn chương. Trong những cuộc đối thoại Hoàng Đăng Khoa thường mời thêm Bakhtine, Barthes, Foucault, Beauvoir… không phải để các cụ ngồi chơi xơi nước mà cùng tham gia vào những hồi trận mới của văn chương Việt.', 3),
							(N'Ehon Wolfoo - Tháp Cốc Sau Cơn Lốc', 68000, 'images/2.jpg', 17, null, 1),
							(N'Khởi Nghiệp Kinh Doanh Online - Bán Hàng Hiệu Quả Trên Facebook', 199000, 'images/7.jpg', 20, N'Khởi Nghiệp Kinh Doanh Online là cẩm nang kinh doanh cơ bản và không thể thiếu dành cho bất cứ ai muốn kinh doanh trên internet. Một cuốn sách được viết theo văn phong của người Việt nên rất DỄ ĐỌC – DỄ HIỂU – GẦN GŨI – ÁP DỤNG ĐƯỢC.', 2),
							(N'199 Bài Và Đoạn Văn Hay 9', 107000, 'images/21.jpg', 30, N'Trong trường học, Ngữ văn là môn học rất quan trọng vì nó góp phần giáo dục tư tưởng, bồi dưỡng, hoàn thiện nhân cách học sinh. Mỗi bài thơ, bài văn, mỗi tác phẩm văn học trong chương trình học phổ thông là một bài học về đạo đức. Nếu không học môn Ngữ văn thì làm sao thế hệ trẻ ngày nay hiểu được những giá trị văn hóa của dân tộc? Hơn nữa, học Ngữ văn chính là cách học làm người. Môn Ngữ văn còn bổ trợ để giúp cho học sinh học tốt các môn học khác.', 6),
							(N'Chạm Đến Tim Con', 79000, 'images/15.jpg', 12, N'Nuôi dạy con chưa bao giờ là việc dễ dàng đối với bậc làm cha, làm mẹ. Sự đấu tranh giữa lý trí và con tim trong nuôi dạy con luôn luôn diễn ra. Bởi lẽ, mỗi hành động, lời nói đều có thể gây tổn thương hoặc cũng có thể giúp con được động viên và thúc đẩy tinh thần.', 4),
							(N'Thao Túng Hành Vi Trong Bán Hàng', 161000, 'images/6.jpg', 10, N'Qua cuốn sách Thao túng hành vi trong bán hàng, chúng ta sẽ biết được cách phân loại các quy luật tâm lý của người mua tiềm năng, tìm hiểu rõ những suy nghĩ ẩn sau các hành vi của khách, từ đó vạch ra các chiến thuật ứng xử và tiếp thị phù hợp, thành công hoàn thiện giao dịch. Cuốn sách cung cấp nội dung toàn diện, chi tiết, đồng thời sử dụng nhiều ví dụ thiết thực để minh họa cho các tình huống thương lượng thường gặp trong thực tiễn bán hàng. Đây được coi là "bí quyết võ công" để doanh nghiệp có thể hiểu hơn về khách hàng của mình và khéo léo truyền thông đến khách hàng một cách chân tình nhất.', 2),
							(N'Kinh Doanh Online', 134000, 'images/8.jpg', 30, N'Cuốn sách “Kinh doanh online” của Johnathan P. Allen còn được “ví von” là cuốn sách giáo khoa bổ ích cung cấp các kiến thức cơ bản cũng như những hướng dẫn thực tế cho các sinh viên  việc sử dụng các nền tảng công nghệ để bắt tay vào khởi nghiệp.', 2),
							(N'30 Công Thức Nấu Ăn Của Yanny ', 55000, 'images/16.jpg', 4, N'Cuốn sách này giới thiệu với các bạn các món chay mới, ngon và dễ làm. Bạn có thể chế biến các món này cho các bữa tiệc chay, buffet chay hay làm món ăn chơi đều thích hợp.', 4),
							(N'Thương', 75000, 'images/13.jpg', 22, N'Được viết bởi các tác giả đến từ Group Thìa Đầy Thơ - nơi hội tụ thế hệ trẻ yêu thơ và làm thơ, "Thương" là một tập thơ rất tình, ngẫu hứng, và đầy sáng tạo. Ở “Thương ” không có bóng dáng của một nhân vật nhất định, nhưng mang lại cho người đọc đầy đủ tất cả cảm xúc về tình yêu, tuổi trẻ và cuộc đời.', 3),
							(N'Business Plan - Lập Kế Hoạch Kinh Doanh Chuyên Nghiệp', 161000, 'images/10.jpg', 15, N'BUSINESS PLAN: Lập kế hoạch kinh doanh chuyên nghiệp cung cấp những hướng dẫn chuyên môn và thực tiễn để chúng ta vạch ra một chương trình hành động hiệu quả, súc tích mà vẫn đảm bảo tính toàn diện. Nếu như muốn khơi dậy động lực, thuyết phục mọi người đầu tư tiền bạc, công sức và thời gian vào doanh nghiệp của bạn, đây chính là cuốn sách bạn cần đọc và áp dụng.', 2),
							(N'Thi Pháp Học', 160000, 'images/11.jpg', 5, N'Thi pháp học là bộ môn khoa học chuyên nghiên cứu hình thức nghệ thuật tác phẩm văn chương. Bộ môn này xuất hiện từ thời cổ đại với mục đích dạy phép tắc sáng tác nghệ thuật. Đầu thế kỷ XX, thi pháp học hiện đại hình thành và chìa làm nhiều khuynh hướng: Thi pháp học thể loại, Ngôn ngữ - Hình thức, Cấu trúc - Ký hiệu học, Phê bình mới, Thi pháp học văn hóa - lịch sử. Thi pháp học ở Việt Nam cũng có đầy đủ các khuynh hướng trên nhưng bước đường phổ biến khá gập ghềnh. Mãi đến cuối thế kỷ XX, nó mới trở thành một phong trào nghiên cứu sâu rộng.', 3),
							(N'Bài Ca Của Khủng Long Bronty', 41000, 'images/5.jpg', 9, N'Bài Ca Của Khủng Long Bronty là tập truyện mới nhất trong bộ truyện tranh “Khác biệt thật là tuyệt” dành cho các bé từ 6 đến 11 tuổi. Bộ truyện gồm 5 tập: “Tắc kè hoa Conker”, “Tắc kè hoa Conker và cái bẫy khỉ”, “Voi con học leo cây”, “Bé Kiwi mũi kỳ lân” và “Bài ca của khủng long Bronty” sẽ dẫn dắt các bé đi vào hành trình khám phá giá trị bản thân cùng các bạn động vật nhỏ trong khu rừng rộng lớn. Những câu chuyện thú vị trong bộ sách không chỉ mang đến cho các em nhỏ những phút giây giải trí từ hình ảnh sống động, đáng yêu mà còn để lại bài học ý nghĩa về sự tự tin và lòng yêu thương.', 1),
							(N'Starter Toeic Third Edition', 159000, 'images/18.jpg', 19, N'Đây chính là hai bộ sách được tổng hợp biên soạn và cập nhật hoá dựa theo những yêu cầu mới của các kỳ thi TOEFL/ TOEIC, đồng thời cũng để đáp ứng nhu cầu học và luyện thi hiện đại. Mỗi bộ sách được chia thành nhiều cấp độ, từ sơ cấp đến nâng cao, phù hợp với mọi trình độ học viên, thuận lợi cho giáo viên trong việc tổ chức học, ra đề thi và sắp lớp đúng trình độ để việc học tập và kiểm tra của học viên đạt kết quả mong muốn. Các học viên có thể tự kiểm tra và chọn cho mình cấp độ phù hợp với khả năng.', 5),
							(N'Thơ Xuân Quỳnh', 69000, 'images/14.jpg', 25, N'Tuyển tập Thơ Xuân Quỳnh giới thiệu tới bạn đọc những bài thơ tình giàu cảm xúc, nồng nàn và dữ dội. Tất cả nhờ tình yêu thương, thấm đẫm nữ tính ấy mà bất chấp mọi khổ đau, buồn phiền của một duyên phận nhiều lận đận, Xuân Quỳnh để lại trong thơ niềm tin vững chắc về sự hiện diện của hạnh phúc có thật giữa trần gian này.', 3),
							(N'Chơi Cùng Momo - Chú Bé Quả Đào', 49000, 'images/4.jpg', 5, N'“Chơi cùng Momo - Chú bé quả đào”, bộ Ehon gồm 5 tựa: Momo đi đâu mà vội thế; Cọ má cọ má nào; Nhào bùn cùng Momo, Oa oa oa; Suỵt, khẽ thôi các bạn ơi!. Những câu chuyện dễ thương, hình ảnh ngộ nghĩnh kể lại những tình huống sự việc xoay quanh cậu bé Momo và những người bạn của mình.', 1),
							(N'Bill Gates - Tham Vọng Lớn Lao & Quá Trình Hình Thành Đế Chế Microsoft', 249000, 'images/9.jpg', 40, N'Cuốn sách này mở ra một câu chuyện sinh động và chân thực nhất về sự nổi lên của một thiên tài độc đoán, cách thức ông làm thay đổi cả một nền công nghiệp máy tính, và lý do tại sao mọi người quyết tâm tìm hiểu ông bằng được.', 2),
							(N'Cha Mẹ Bận Rộn', 169000, 'images/17.jpg', 13, N'Cuốn sách này đưa ra những chỉ dẫn và bài tập giúp bạn vượt qua được thời gian khó khăn khi con cái còn quá nhỏ mà bạn vẫn phải đi làm. Hai vai trò, hai trách nhiệm lớn, bậc cha mẹ đi làm phải cân đối và điều chỉnh cảm xúc để không rơi vào bế tắc và kiệt sức.', 4),
							(N'Tự Học Viết Tiếng Nhật Căn Bản Hiragana', 49000, 'images/19.jpg', 30, N'Đây là bộ tài liệu được biên soạn kỹ lưỡng nhằm giúp người học có thể nhanh chóng nắm vững bộ vần 46 ký tự Hiragana và Katakana, hai bộ vần căn bản của tiếng Nhật.', 5),
							(N'Bé Tập Tô Phát Triển Tư Duy', 16000, 'images/20.jpg', 26, N'Bộ sách “Bé tập tô phát triển tư duy” đang chờ bạn khám phá qua 16 quyển sách xinh xắn, được chia thành 2 chủ đề chính là “Tập tô - tập viết” và “Câu đố tư duy”. Mỗi tập đều chứa những bài tập trực quan kết hợp cùng những trò chơi tư duy vui nhộn đem đến cho bé những trải nghiệm và kiến thức bổ ích.', 6),
							(N'Khi Mẹ Vắng Nhà', 53000, 'images/3.jpg', 10, null, 1),
							(N'Bí quyết tự học chinh phục song ngữ Anh, Trung', 241000, 'images/22.jpg', 10, N'Điều đặc biệt ở cuốn sách này mà ít nơi có được là những bí quyết, kinh nghiệm thực tiễn mà tác giả tổng hợp lại trên con đường chinh phục tiếng Anh và tiếng Trung của chính mình, được truyền tải đến bạn thông qua những câu chuyện và ví dụ thực tế. Hành trình đó có đầy rẫy những khó khăn, vấp váp, biết bao lần sai ngã rồi lại đứng dậy đi tiếp, biết bao nhiêu thời gian tác giả mày mò nghiên cứu nhằm chọn ra con đường ngắn nhất, hiệu quả nhất để học tiếng Anh và tiếng Trung, để rồi hai thứ ngôn ngữ ấy đem đến.', 5),
							(N'Tâm Lý Học - Think Psychology - Text Book', 405000, 'images/23.jpg', 22, null, 6)
						 
