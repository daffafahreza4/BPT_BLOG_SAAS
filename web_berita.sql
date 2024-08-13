-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table web_berita.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_user_id_foreign` (`user_id`),
  CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.categories: ~1 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
	(6, 'News', 'News', 1, '2024-08-13 02:02:36', '2024-08-13 04:07:19'),
	(7, 'CheatSheet', 'cheatsheet', 1, '2024-08-13 04:43:08', '2024-08-13 04:43:08'),
	(8, 'Championship', 'championship', 1, '2024-08-13 04:54:11', '2024-08-13 04:54:11');

-- Dumping structure for table web_berita.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.comments: ~0 rows (approximately)

-- Dumping structure for table web_berita.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table web_berita.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.jobs: ~0 rows (approximately)

-- Dumping structure for table web_berita.memberships
CREATE TABLE IF NOT EXISTS `memberships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `feature` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.memberships: ~3 rows (approximately)
INSERT INTO `memberships` (`id`, `role`, `price`, `feature`, `created_at`, `updated_at`) VALUES
	(1, 'Free', 0.00, 'Free Read Content', '2024-08-13 02:03:35', '2024-08-13 03:18:13'),
	(2, 'Premium', 10.00, 'Acces more news', '2024-08-13 03:20:28', '2024-08-13 03:20:28'),
	(3, 'Gold', 25.00, 'Can access very important news', '2024-08-13 03:21:49', '2024-08-13 03:21:49');

-- Dumping structure for table web_berita.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.migrations: ~18 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_11_210814_create_roles_table', 1),
	(2, '2014_10_12_000000_create_users_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2022_12_27_115853_create_categories_table', 1),
	(7, '2022_12_27_115916_create_posts_table', 1),
	(8, '2023_01_05_224832_create_settings_table', 1),
	(9, '2023_01_07_092440_create_pages_table', 1),
	(10, '2023_01_09_192208_create_tags_table', 1),
	(11, '2023_01_09_192602_create_post_tag_table', 1),
	(12, '2023_05_10_065356_create_jobs_table', 1),
	(13, '2023_05_21_124852_create_comments_table', 1),
	(14, '2024_08_12_032047_create_memberships_table', 1),
	(15, '2024_08_12_052357_drop_upgrade_proofs_table', 1),
	(16, '2024_08_12_052501_create_upgrade_proofs_table', 1),
	(17, '2024_08_12_063248_add_column_to_posts_table', 1),
	(18, '2024_08_13_045210_add_column_name_to_users_table', 1);

-- Dumping structure for table web_berita.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navbar` tinyint(1) NOT NULL DEFAULT '0',
  `footer` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_user_id_foreign` (`user_id`),
  CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.pages: ~1 rows (approximately)
INSERT INTO `pages` (`id`, `name`, `content`, `slug`, `navbar`, `footer`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'About', '<p style="-webkit-font-smoothing: antialiased; word-break: break-word; overflow-wrap: break-word; margin-bottom: 1rem; color: rgb(97, 102, 105); font-family: Roboto, sans-serif; font-size: 16px; letter-spacing: 0.1px; background-color: rgb(255, 255, 255);">Bandung Techno Park (BTP) merupakan salah satu&nbsp;<span style="-webkit-font-smoothing: antialiased; word-break: break-word; overflow-wrap: break-word; color: rgb(179, 44, 47);"><em style="-webkit-font-smoothing: antialiased; word-break: break-word; overflow-wrap: break-word;">science techno park</em></span>&nbsp;terbesar di Indonesia dan sebagai sentral untuk membangun kualitas ICT. BTP menjadi salah satu wujud keseriusan Telkom University menuju&nbsp;<span style="-webkit-font-smoothing: antialiased; word-break: break-word; overflow-wrap: break-word; color: rgb(179, 44, 47);"><em style="-webkit-font-smoothing: antialiased; word-break: break-word; overflow-wrap: break-word;">entrepreneurial university</em></span>.</p><p style="-webkit-font-smoothing: antialiased; word-break: break-word; overflow-wrap: break-word; color: rgb(97, 102, 105); font-family: Roboto, sans-serif; font-size: 16px; letter-spacing: 0.1px; background-color: rgb(255, 255, 255);">BTP berfungsi sebagai&nbsp;<span style="-webkit-font-smoothing: antialiased; word-break: break-word; overflow-wrap: break-word; color: rgb(179, 44, 47);">perantara dan pembangun sinergi&nbsp;</span>antara akademisi, dunia usaha atau industri, pemerintah dan masyarakat.</p>', 'about', 1, 0, 1, '2024-08-13 03:23:00', '2024-08-13 03:26:29');

-- Dumping structure for table web_berita.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.password_resets: ~0 rows (approximately)

-- Dumping structure for table web_berita.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table web_berita.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `category_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `membership_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.posts: ~2 rows (approximately)
INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `image`, `status`, `views`, `category_id`, `user_id`, `created_at`, `updated_at`, `membership_id`) VALUES
	(1, 'Magang', 'magang', '<p>Magang adalah salah satu langkah penting dalam proses pembelajaran dan pengembangan karier. Bagi banyak mahasiswa atau siswa, magang menjadi jembatan antara teori yang dipelajari di bangku kuliah dengan praktik di dunia kerja sesungguhnya. Melalui magang, individu dapat merasakan langsung dinamika lingkungan kerja, beradaptasi dengan budaya perusahaan, serta memahami tanggung jawab dan tantangan yang dihadapi oleh para profesional di bidang yang diminati. Pengalaman ini sangat berharga karena memberikan kesempatan untuk mengembangkan keterampilan praktis dan memperluas jaringan profesional.</p><p>Selama magang, para peserta tidak hanya belajar tentang tugas-tugas teknis, tetapi juga soft skills seperti komunikasi, kerjasama tim, dan manajemen waktu. Berinteraksi dengan rekan kerja dan atasan memungkinkan mereka untuk belajar cara berkomunikasi secara efektif, baik secara lisan maupun tulisan. Selain itu, kemampuan untuk bekerja dalam tim menjadi penting ketika menghadapi proyek-proyek bersama, di mana kerjasama dan koordinasi yang baik menjadi kunci kesuksesan. Dengan mengelola waktu dan prioritas dengan tepat, peserta magang dapat menyelesaikan tugas yang diberikan dengan efisien, meskipun seringkali harus menghadapi tenggat waktu yang ketat.</p><p>Magang juga memberikan kesempatan bagi peserta untuk mengeksplorasi lebih dalam mengenai industri atau bidang kerja tertentu. Mereka dapat mengetahui apakah bidang tersebut benar-benar sesuai dengan minat dan keahlian mereka. Tidak jarang, melalui magang, peserta menyadari bahwa mereka lebih tertarik pada bidang lain yang sebelumnya tidak pernah mereka pertimbangkan. Hal ini membuka peluang untuk mengarahkan karier mereka ke jalur yang lebih sesuai dengan passion dan potensi diri.</p><p>Selain itu, magang sering kali menjadi langkah awal untuk mendapatkan pekerjaan tetap di perusahaan tersebut. Banyak perusahaan yang menggunakan program magang sebagai alat untuk mencari dan merekrut talenta baru. Jika seorang peserta magang mampu menunjukkan kinerja yang baik dan memberikan kontribusi yang signifikan, tidak jarang mereka akan ditawari posisi tetap setelah program magang selesai. Dengan demikian, magang bukan hanya sekadar pengalaman belajar, tetapi juga peluang nyata untuk memulai karier.</p><p>Pada akhirnya, magang memberikan pengalaman yang tak ternilai bagi setiap individu yang menjalani prosesnya. Bagi sebagian orang, magang adalah momen penentu dalam memutuskan arah karier yang ingin diambil. Bagi yang lain, magang menjadi langkah awal yang memuluskan jalan menuju kesuksesan profesional. Dengan memaksimalkan setiap kesempatan yang ada selama magang, peserta tidak hanya mendapatkan pengetahuan dan keterampilan baru, tetapi juga membangun pondasi yang kuat untuk masa depan mereka.</p>', 'images/posts/zGYOI7FMMRlNbfwMW9P2n9aPPG9haf6zuo45Nltz.png', 1, 2, 6, 1, '2024-08-13 02:04:13', '2024-08-13 04:40:24', 1),
	(52, 'Himbauan Pemayaran UKT', 'himbauan-pemayaran-ukt', '<p>UKT (Uang Kuliah Tunggal) merupakan kewajiban yang harus dipenuhi oleh setiap mahasiswa untuk mendukung kelancaran proses pendidikan. Pembayaran UKT tepat waktu adalah tanggung jawab yang harus dijalankan oleh seluruh mahasiswa guna memastikan berbagai layanan akademik dapat berjalan dengan baik. Dengan membayar UKT, mahasiswa turut berperan aktif dalam mendukung operasional kampus yang akan memberikan dampak positif terhadap fasilitas dan kualitas pendidikan.</p><p>Keterlambatan dalam membayar UKT dapat berakibat pada terganggunya layanan akademik, seperti akses terhadap fasilitas kampus, bimbingan akademik, hingga pengurusan administrasi lainnya. Selain itu, mahasiswa yang tidak membayar UKT tepat waktu juga berisiko mengalami penundaan atau hambatan dalam proses perkuliahan mereka. Oleh karena itu, sangat penting untuk memperhatikan jadwal pembayaran dan memastikan kewajiban ini dapat dipenuhi sesuai dengan waktu yang ditentukan.</p><p>Kampus telah menyediakan berbagai metode pembayaran yang memudahkan mahasiswa dalam melaksanakan kewajiban mereka. Berbagai pilihan pembayaran, mulai dari transfer bank, pembayaran online, hingga pembayaran di loket kampus, semuanya disediakan demi kenyamanan mahasiswa. Selain itu, kampus juga memberikan informasi yang jelas terkait tenggat waktu pembayaran, sehingga mahasiswa dapat mengatur jadwal mereka dengan baik.</p><p>Kami mengimbau kepada seluruh mahasiswa untuk segera menyelesaikan pembayaran UKT sesuai dengan jadwal yang telah ditentukan. Memastikan bahwa UKT telah dibayarkan tepat waktu tidak hanya membantu kelancaran proses belajar mengajar, tetapi juga menghindarkan mahasiswa dari konsekuensi administratif yang mungkin timbul. Dengan demikian, setiap mahasiswa dapat fokus pada studi mereka tanpa terganggu oleh masalah keuangan.</p><p>Akhir kata, mari bersama-sama kita dukung kelancaran proses pendidikan di kampus kita tercinta dengan membayar UKT tepat waktu. Kepatuhan terhadap kewajiban ini adalah cerminan dari kedewasaan dan tanggung jawab kita sebagai mahasiswa. Kami berharap agar semua mahasiswa dapat mengerti pentingnya peran UKT dalam menjaga kualitas pendidikan dan mematuhi kewajiban ini dengan baik.</p>', 'images/posts/3gxnhIO7yc3sygcRy3vQwasMgQHhmLA1G3hAis8x.png', 1, 1, 6, 5, '2024-08-13 04:36:22', '2024-08-13 04:37:24', 1),
	(54, 'Cheat Sheet', 'cheat-sheet', '<p>Matematika merupakan ilmu yang kaya dengan konsep-konsep dasar yang penting untuk dipahami. Salah satu dasar terpenting adalah <strong>aritmetika</strong>, yang melibatkan operasi penjumlahan, pengurangan, perkalian, dan pembagian. Penjumlahan dan pengurangan adalah operasi dasar yang sering digunakan untuk menghitung jumlah atau selisih dari dua atau lebih angka. Sementara itu, perkalian adalah pengulangan penjumlahan, dan pembagian adalah proses pembagian suatu jumlah menjadi bagian yang sama besar.</p><p>Konsep lain yang penting dalam matematika adalah <strong>aljabar</strong>, yang menggunakan simbol untuk merepresentasikan angka. Variabel seperti <span class="katex"><span class="katex-mathml"><math xmlns="http://www.w3.org/1998/Math/MathML"><semantics><mrow><mi>x</mi></mrow><annotation encoding="application/x-tex">x</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"></span><span class="mord mathnormal">x</span></span></span></span> atau <span class="katex"><span class="katex-mathml"><math xmlns="http://www.w3.org/1998/Math/MathML"><semantics><mrow><mi>y</mi></mrow><annotation encoding="application/x-tex">y</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"></span><span class="mord mathnormal">y</span></span></span></span> sering digunakan dalam persamaan untuk menyelesaikan masalah yang melibatkan hubungan antara dua atau lebih kuantitas. Aljabar juga mencakup aturan-aturan penting seperti distribusi, asosiasi, dan komutatif, yang membantu dalam penyederhanaan persamaan dan ekspresi matematika.</p><p>Selain itu, <strong>geometri</strong> adalah cabang matematika yang berhubungan dengan bentuk, ukuran, dan posisi relatif dari objek-objek dalam ruang. Beberapa konsep dasar dalam geometri meliputi titik, garis, bidang, dan sudut. Di sini, teorema-teorema seperti Teorema Pythagoras menjadi alat penting untuk menghitung jarak antara dua titik dalam ruang dua dimensi. Geometri juga mencakup konsep-konsep seperti simetri, rotasi, dan translasi.</p><p>Selanjutnya, <strong>trigonometri</strong> adalah cabang matematika yang mempelajari hubungan antara sudut dan sisi dalam segitiga. Fungsi-fungsi trigonometri seperti sinus, kosinus, dan tangen digunakan untuk menghitung sisi atau sudut dalam segitiga. Trigonometri sangat penting dalam berbagai aplikasi, mulai dari navigasi, arsitektur, hingga teknik.</p><p>Akhirnya, <strong>kalkulus</strong> merupakan cabang matematika yang menangani konsep perubahan. Kalkulus dibagi menjadi dua bagian utama: diferensial dan integral. Diferensial digunakan untuk menentukan laju perubahan suatu fungsi, sedangkan integral digunakan untuk menentukan total akumulasi dari perubahan tersebut. Kalkulus adalah alat penting dalam fisika dan teknik, di mana perubahan dinamis dan akumulasi merupakan konsep yang sangat penting.</p>', 'images/posts/iQH3YC4mYUwuN9wkF3f5zMH2waunEHB74hCdUn9y.jpg', 1, 1, 7, 6, '2024-08-13 04:46:39', '2024-08-13 04:46:54', 2),
	(55, 'Cheat Sheet Fisika', 'cheat-sheet-fisika', '<p>Fisika adalah cabang ilmu pengetahuan yang mempelajari fenomena alam dan prinsip-prinsip dasar yang mengatur pergerakan materi dan energi di alam semesta. Dalam mempelajari fisika, kita sering kali dihadapkan pada konsep-konsep dasar yang mencakup kinematika, dinamika, energi, momentum, dan hukum-hukum fisika seperti Hukum Newton. Pemahaman terhadap konsep-konsep ini sangat penting karena mereka menjadi fondasi untuk topik-topik lanjutan seperti termodinamika, elektromagnetisme, optik, dan fisika kuantum.</p><p>Kinematika, sebagai salah satu cabang fisika, fokus pada studi tentang gerak benda tanpa mempertimbangkan penyebab gerakan tersebut. Dalam kinematika, penting untuk memahami besaran-besaran seperti jarak, perpindahan, kecepatan, percepatan, dan waktu. Rumus-rumus kinematika yang sering digunakan meliputi <span class="katex"><span class="katex-mathml"><math xmlns="http://www.w3.org/1998/Math/MathML"><semantics><mrow><mi>v</mi><mo>=</mo><mfrac><mi>s</mi><mi>t</mi></mfrac></mrow><annotation encoding="application/x-tex">v = \\frac{s}{t}</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"></span><span class="mord mathnormal">v</span><span class="mspace"></span><span class="mrel">=</span><span class="mspace"></span></span><span class="base"><span class="strut"></span><span class="mord"><span class="mopen nulldelimiter"></span><span class="mfrac"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"><span class="pstrut"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mathnormal mtight">t</span></span></span><span class="pstrut"></span><span class="frac-line"></span><span class="pstrut"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mathnormal mtight">s</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist"></span></span></span></span><span class="mclose nulldelimiter"></span></span></span></span></span> untuk kecepatan, <span class="katex"><span class="katex-mathml"><math xmlns="http://www.w3.org/1998/Math/MathML"><semantics><mrow><mi>a</mi><mo>=</mo><mfrac><mi>v</mi><mi>t</mi></mfrac></mrow><annotation encoding="application/x-tex">a = \\frac{v}{t}</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"></span><span class="mord mathnormal">a</span><span class="mspace"></span><span class="mrel">=</span><span class="mspace"></span></span><span class="base"><span class="strut"></span><span class="mord"><span class="mopen nulldelimiter"></span><span class="mfrac"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"><span class="pstrut"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mathnormal mtight">t</span></span></span><span class="pstrut"></span><span class="frac-line"></span><span class="pstrut"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mathnormal mtight">v</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist"></span></span></span></span><span class="mclose nulldelimiter"></span></span></span></span></span> untuk percepatan, dan persamaan gerak lurus beraturan seperti <span class="katex"><span class="katex-mathml"><math xmlns="http://www.w3.org/1998/Math/MathML"><semantics><mrow><mi>s</mi><mo>=</mo><msub><mi>v</mi><mn>0</mn></msub><mi>t</mi><mo>+</mo><mfrac><mn>1</mn><mn>2</mn></mfrac><mi>a</mi><msup><mi>t</mi><mn>2</mn></msup></mrow><annotation encoding="application/x-tex">s = v_0 t + \\frac{1}{2} a t^2</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"></span><span class="mord mathnormal">s</span><span class="mspace"></span><span class="mrel">=</span><span class="mspace"></span></span><span class="base"><span class="strut"></span><span class="mord"><span class="mord mathnormal">v</span><span class="msupsub"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"><span class="pstrut"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight">0</span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist"></span></span></span></span></span><span class="mord mathnormal">t</span><span class="mspace"></span><span class="mbin">+</span><span class="mspace"></span></span><span class="base"><span class="strut"></span><span class="mord"><span class="mopen nulldelimiter"></span><span class="mfrac"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist"><span class="pstrut"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mtight">2</span></span></span><span class="pstrut"></span><span class="frac-line"></span><span class="pstrut"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mtight">1</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist"></span></span></span></span><span class="mclose nulldelimiter"></span></span><span class="mord mathnormal">a</span><span class="mord"><span class="mord mathnormal">t</span><span class="msupsub"><span class="vlist-t"><span class="vlist-r"><span class="vlist"><span class="pstrut"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight">2</span></span></span></span></span></span></span></span></span></span>.</p><p>Dinamika, di sisi lain, mempelajari hubungan antara gaya dan gerak. Hukum Newton merupakan dasar dari dinamika dan dapat diringkas dalam tiga hukum: (1) Hukum Inersia yang menyatakan bahwa sebuah benda akan tetap dalam keadaan diam atau bergerak lurus beraturan kecuali ada gaya eksternal yang bekerja, (2) Hukum Akselerasi yang menyatakan bahwa percepatan sebuah benda berbanding lurus dengan gaya yang bekerja padanya dan berbanding terbalik dengan massanya (<span class="katex"><span class="katex-mathml"><math xmlns="http://www.w3.org/1998/Math/MathML"><semantics><mrow><mi>F</mi><mo>=</mo><mi>m</mi><mi>a</mi></mrow><annotation encoding="application/x-tex">F = ma</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut"></span><span class="mord mathnormal">F</span><span class="mspace"></span><span class="mrel">=</span><span class="mspace"></span></span><span class="base"><span class="strut"></span><span class="mord mathnormal">ma</span></span></span></span>), dan (3) Hukum Aksi-Reaksi yang menyatakan bahwa setiap aksi memiliki reaksi yang sama besar dan berlawanan arah.</p><p>Energi dan momentum adalah konsep penting lainnya dalam fisika. Energi dibagi menjadi energi kinetik, yang terkait dengan gerak, dan energi potensial, yang terkait dengan posisi atau keadaan. Hukum kekekalan energi menyatakan bahwa energi tidak dapat diciptakan atau dimusnahkan, hanya dapat berubah bentuk. Momentum, yang didefinisikan sebagai hasil kali massa dan kecepatan, juga mematuhi hukum kekekalan, di mana total momentum dalam sistem tertutup akan tetap konstan, kecuali ada gaya luar yang bekerja.</p><p>Selain konsep-konsep dasar ini, fisika juga mencakup berbagai topik lain seperti termodinamika, yang mempelajari hubungan antara panas dan kerja, serta elektromagnetisme, yang mempelajari medan listrik dan magnet serta interaksinya. Memiliki cheatsheet fisika yang mencakup rumus-rumus penting, hukum-hukum dasar, serta konsep-konsep kunci dapat sangat membantu dalam memahami dan mengingat materi ini dengan lebih efektif, terutama saat menghadapi ujian atau tugas-tugas akademik lainnya.</p>', 'images/posts/wj4RNei8oPJ2XFLGoLXa6LndL8avd6jAa4vgnoAQ.jpg', 1, 1, 7, 7, '2024-08-13 04:51:21', '2024-08-13 05:28:28', 2),
	(56, 'Championship', 'championship', '<p dir="ltr" style="margin-bottom: 1rem; color: rgb(61, 61, 61); font-family: Quicksand, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);">Hi developers! Di tahun 2024 ini, Google Cloud bekerja sama dengan Dicoding mengadakan program BARU yaitu: Google Arcade Facilitator.</p><p dir="ltr" style="margin-bottom: 1rem; color: rgb(61, 61, 61); font-family: Quicksand, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);">Program ini merupakan&nbsp;<span style="font-weight: 700;">beasiswa coding dari Google Cloud</span>&nbsp;yang bekerja sama dengan&nbsp;<span style="font-weight: 700;">Dicoding&nbsp;</span>dengan konsep&nbsp;<span style="font-weight: 700;">gamifikasi&nbsp;</span>untuk menambah atau meningkatkan skill talenta digital di bidang cloud computing, pengembangan aplikasi, big data &amp; artificial intelligence/machine learning.&nbsp;</p><p dir="ltr" style="margin-bottom: 1rem; color: rgb(61, 61, 61); font-family: Quicksand, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);">Peserta yang mengikuti program ini akan meraih badge digital dan poin yang dapat digunakan untuk ditukar dengan&nbsp;<span style="font-weight: 700;">hadiah menarik dan merchandise Google Cloud!</span></p><p dir="ltr" style="margin-bottom: 1rem; color: rgb(61, 61, 61); font-family: Quicksand, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);">Sebagai salah satu rangkaian pada program ini, tim Google Arcade Facilitator akan mengadakan event online “<span style="font-weight: 700;">Kickoff Google Arcade Facilitator</span>” untuk calon peserta dan fasilitator pada program Google Arcade Fasilitator 2024.</p><p dir="ltr" style="margin-bottom: 1rem; color: rgb(61, 61, 61); font-family: Quicksand, sans-serif; font-size: 16px; background-color: rgb(255, 255, 255);">Event ini akan diselenggarakan pada:<br>Hari dan tanggal: Rabu, 15 Mei 2024<br>Waktu: 15.30 - 17.00 WIB</p>', 'images/posts/wQujdWgBcM32ib7LUvrCyN9Lb7YLpNXqCcmf9AwW.png', 1, 0, 8, 8, '2024-08-13 04:55:29', '2024-08-13 04:55:29', 3),
	(57, 'Game Developer Championship Bali', 'game-developer-championship-bali', '<p>Hi developers! Di tahun 2024 ini, Bali Game Developer Community bekerja sama dengan Dicoding mengadakan program BARU yaitu: <strong>Game Developer Championship Bali</strong>.</p><p>Program ini merupakan ajang kompetisi coding bagi para game developer di Bali yang berkolaborasi dengan Dicoding, dengan konsep gamifikasi untuk mengasah atau meningkatkan keterampilan talenta digital di bidang pengembangan game, desain interaktif, dan inovasi teknologi.</p><p>Peserta yang mengikuti kompetisi ini akan mendapatkan badge digital dan poin yang dapat ditukar dengan hadiah menarik serta merchandise eksklusif dari Bali Game Developer Community!</p><p>Sebagai salah satu rangkaian dalam program ini, tim Game Developer Championship Bali akan mengadakan event online “Kickoff Game Developer Championship Bali” untuk calon peserta dan pengembang game pada program ini di tahun 2024.</p><p>Event ini akan diselenggarakan pada:\r\nHari dan tanggal: Rabu, 15 Mei 2024\r\nWaktu: 15.30 - 17.00 WITA</p>', 'images/posts/338doZXewnlUGoA2vo5UK3EGsCTD4Di1dqCv1d51.png', 1, 1, 8, 8, '2024-08-13 04:58:01', '2024-08-13 04:58:15', 3);

-- Dumping structure for table web_berita.post_tag
CREATE TABLE IF NOT EXISTS `post_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_post_id_foreign` (`post_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.post_tag: ~0 rows (approximately)
INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL),
	(3, 54, 13, NULL, NULL),
	(4, 55, 13, NULL, NULL),
	(5, 56, 14, NULL, NULL),
	(6, 57, 14, NULL, NULL);

-- Dumping structure for table web_berita.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.roles: ~3 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', '2024-08-13 01:01:03', '2024-08-13 01:01:03'),
	(2, 'Writer', '2024-08-13 01:01:03', '2024-08-13 01:01:03'),
	(3, 'User', '2024-08-13 01:01:03', '2024-08-13 01:01:03');

-- Dumping structure for table web_berita.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `about` text COLLATE utf8mb4_unicode_ci,
  `copy_rights` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_fb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_insta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.settings: ~1 rows (approximately)
INSERT INTO `settings` (`id`, `site_name`, `contact_email`, `description`, `about`, `copy_rights`, `url_fb`, `url_insta`, `url_twitter`, `url_linkedin`, `created_at`, `updated_at`) VALUES
	(1, 'Blog BTP', 'BTP@BTP.com', 'Web berita untuk Bandung Techno Park', 'Web berita untuk Bandung Techno Park', 'Daffa&Varell', 'https://www.facebook.com/technopark/?locale=id_ID', 'https://www.instagram.com/bandungtechnopark/?hl=en', 'https://twitter.com/info_btp?lang=en', 'https://www.linkedin.com/company/bandung-techno-park/?originalSubdomain=id', '2024-08-13 01:30:37', '2024-08-13 05:22:41');

-- Dumping structure for table web_berita.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.tags: ~1 rows (approximately)
INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'News', '2024-08-13 02:02:21', '2024-08-13 03:16:44'),
	(13, 'CheatSheet', '2024-08-13 04:42:07', '2024-08-13 04:42:07'),
	(14, 'Championship Information', '2024-08-13 04:54:27', '2024-08-13 04:54:27');

-- Dumping structure for table web_berita.upgrade_proofs
CREATE TABLE IF NOT EXISTS `upgrade_proofs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `membership_id` bigint unsigned NOT NULL,
  `proof_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upgrade_proofs_user_id_foreign` (`user_id`),
  KEY `upgrade_proofs_membership_id_foreign` (`membership_id`),
  CONSTRAINT `upgrade_proofs_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upgrade_proofs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.upgrade_proofs: ~0 rows (approximately)
INSERT INTO `upgrade_proofs` (`id`, `user_id`, `membership_id`, `proof_image`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 2, 'proofs/PFs2UFoXWkfBt5OIAWc1DperEyV83dwXm0e7VKDW.jpg', 'pending', '2024-08-13 05:25:35', '2024-08-13 05:25:35');

-- Dumping structure for table web_berita.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint unsigned NOT NULL DEFAULT '3',
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_fb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_insta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `membership_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_berita.users: ~9 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `bio`, `avatar`, `url_fb`, `url_insta`, `url_twitter`, `url_linkedin`, `news_letter`, `remember_token`, `created_at`, `updated_at`, `membership_id`) VALUES
	(1, 'admin', 'admin@admin.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1KJaoEH5BTos87xfrLWiM8jH7g6S0hMO8OEX7lH9X7nfw0ZjGmXo84MliqQS', '2024-08-13 01:31:57', '2024-08-13 01:31:57', 1),
	(2, 'user1', 'user1@user.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'RY0TreJ45vM66TFNuxr3ebUHRtjjffAAk6aGpwMYvAV4Wjrm7tJ7r6y9iLII', '2024-08-13 01:31:57', '2024-08-13 01:31:57', 1),
	(3, 'user2', 'user2@user.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'BcEYhl4KaWvVZkmv0KK6am6mshFhDC6Ig6R8RHdoRUj1PjPdDMjNSctzSG1k', '2024-08-13 01:31:57', '2024-08-13 05:27:45', 2),
	(4, 'user3', 'user3@user.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'vZzflWwX79g0TOxYpnPAvIv7o2jBjSaTgwiGEkqcTOsZLlz2PFZCR78PAC2p', '2024-08-13 01:31:57', '2024-08-13 05:27:46', 3),
	(5, 'dosen', 'dosen1@dosen.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'uJjeWMHQbtmQPuQhUuONrTtRvvtzWYQIZOBL98bbsuGA130aUksxHSCIUG3Y', '2024-08-13 01:31:57', '2024-08-13 01:31:57', 1),
	(6, 'dosen', 'dosen2@dosen.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'jzZcfR44KOw2n5Ixm5m5AgLIotvqEh3ebTCoIgVQDEtUtxVF3zVQYyZC4sDs', '2024-08-13 01:31:57', '2024-08-13 01:31:57', 1),
	(7, 'dosen', 'dosen3@dosen.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, '4VzSUnKIKHxolpqrV5JXUP1xs91iJUzpuiBjfLtBBp63WepH93IBQCZEjHGW', '2024-08-13 01:31:57', '2024-08-13 01:31:57', 1),
	(8, 'dosen', 'dosen4@dosen.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'W3n1R2pKiJvH0Tt1PyL0M4zSyFlKOr22MNjKt4QeN3sGHsN6raqn80dRjnUm', '2024-08-13 01:31:57', '2024-08-13 01:31:57', 1),
	(9, 'dosen', 'dosen5@dosen.com', '2024-08-13 08:35:59', '$2y$10$TBltZZzfocMSgQClovP5deOge8..vkQjOI1PDPIA7kKtk38hrl6/i', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'uEGcnTMGPyLz9NwMfD8MCzqp3gF2ghjeV3Bnarxrr2bzSs3RkhJfKhyVEtqx', '2024-08-13 01:31:57', '2024-08-13 01:31:57', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
