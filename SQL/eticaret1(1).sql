-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 Kas 2020, 18:17:21
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `eticaret1`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cargofirms`
--

CREATE TABLE `cargofirms` (
  `id` int(10) UNSIGNED NOT NULL,
  `cargoFirmsLogo` varchar(30) DEFAULT NULL,
  `term` varchar(6) NOT NULL,
  `cargoFirmsName` varchar(100) NOT NULL,
  `cargoFee` double UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `productType` varchar(100) NOT NULL,
  `categoriesName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `productType`, `categoriesName`) VALUES
(1, 'ÜST GİYİM', 'Ceket'),
(2, 'ÜST GİYİM', 'Gömlek'),
(3, 'ÜST GİYİM', 'Kazak & SweatShirt'),
(4, 'ÜST GİYİM', 'Tişört'),
(5, 'ALT GİYİM', 'Mayo'),
(6, 'ALT GİYİM', 'Etek'),
(7, 'ALT GİYİM', 'Pantolon'),
(8, 'ALT GİYİM', 'Şort'),
(9, 'AYAKKABILAR', 'Spor Ayakkabı'),
(10, 'AYAKKABILAR', 'Klasik Ayakkabı'),
(11, 'AYAKKABILAR', 'Yürüyüş Ayakkabısı'),
(13, 'AKSESUARLAR', 'Saat'),
(14, 'AKSESUARLAR', 'Çanta'),
(15, 'AKSESUARLAR', 'Güneş Gözlükleri'),
(16, 'AKSESUARLAR', 'Genel Aksesuar'),
(18, 'AYAKKABILAR', 'topuklu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contracts`
--

CREATE TABLE `contracts` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `aboutUs` text DEFAULT NULL,
  `customerServices` text NOT NULL,
  `siteMap` text NOT NULL,
  `userAggrement` text DEFAULT NULL,
  `termsOfUse` text DEFAULT NULL,
  `privacyPolicy` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `contracts`
--

INSERT INTO `contracts` (`id`, `aboutUs`, `customerServices`, `siteMap`, `userAggrement`, `termsOfUse`, `privacyPolicy`) VALUES
(1, 'Burası Hakkımızda Metnidir.', 'Burası Müşteri Hizmetleri Metnidir.', 'Burası Site Haritası Bölümü Dür.nonon', 'Burası Üyelik Sözleşmesi Metnidir.xczxcxz', 'Burası Kullanım Koşulları Metnidir.', 'Burası Gizlilik Sözleşmesi Metnidir.dxasdasdasds');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `favourites`
--

CREATE TABLE `favourites` (
  `id` int(10) UNSIGNED NOT NULL,
  `productid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `intro`
--

CREATE TABLE `intro` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(33) COLLATE utf8mb4_turkish_ci NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `linkText` varchar(55) COLLATE utf8mb4_turkish_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `intro`
--

INSERT INTO `intro` (`id`, `title`, `text`, `linkText`, `link`, `image`, `date`) VALUES
(15, 'Quo omnis nostrum au', 'Consequat Dolorem s', 'Dolorum odio sed mol', 'Facere aute explicab', 'assets/images/5474445890instagram-img-03.jpg', '2020-11-11 16:24:46'),
(17, 'Fugit numquam quis', 'In cupidatat corrupt', 'In rem quia quasi vi', 'Nihil ab et ad esse', 'assets/images/5055445047instagram-img-08.jpg', '2020-11-11 16:24:34'),
(18, 'Sunt praesentium non', 'Eaque id ut consequa', 'Quibusdam suscipit a', 'Non reprehenderit q', 'assets/images/3401730260instagram-img-01.jpg', '2020-11-11 16:24:17');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `managers`
--

CREATE TABLE `managers` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nameSurname` varchar(100) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `originManagerStatus` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `managers`
--

INSERT INTO `managers` (`id`, `username`, `password`, `nameSurname`, `mail`, `phone`, `originManagerStatus`) VALUES
(1, 'manager', '670f8574bd93dd78bd568dab84c6733a', 'fucking manager', 'blegojcan@gmail.com', '05417880000', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `orderid` int(10) UNSIGNED NOT NULL,
  `productid` int(10) UNSIGNED NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` double UNSIGNED NOT NULL,
  `totalPayPrice` double NOT NULL,
  `productAmount` int(3) UNSIGNED NOT NULL,
  `cargoFirmOptions` varchar(100) DEFAULT NULL,
  `cargoFee` double UNSIGNED NOT NULL,
  `productimage1` varchar(30) NOT NULL,
  `size` varchar(100) NOT NULL,
  `adressName` varchar(100) NOT NULL,
  `adressSurname` varchar(100) NOT NULL,
  `addressType` varchar(100) NOT NULL,
  `addressDetails` varchar(255) NOT NULL,
  `addressPhone` varchar(11) NOT NULL,
  `paymentOptions` varchar(25) NOT NULL,
  `ccName` text NOT NULL,
  `ccCardNumber` int(25) NOT NULL,
  `ccExpDate` varchar(7) NOT NULL,
  `ccCVV` int(5) NOT NULL,
  `orderDate` int(10) NOT NULL,
  `orderipAddress` varchar(20) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `cargoStatus` tinyint(1) UNSIGNED NOT NULL,
  `cargoShipmentCode` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `userid`, `orderid`, `productid`, `productName`, `productPrice`, `totalPayPrice`, `productAmount`, `cargoFirmOptions`, `cargoFee`, `productimage1`, `size`, `adressName`, `adressSurname`, `addressType`, `addressDetails`, `addressPhone`, `paymentOptions`, `ccName`, `ccCardNumber`, `ccExpDate`, `ccCVV`, `orderDate`, `orderipAddress`, `status`, `cargoStatus`, `cargoShipmentCode`) VALUES
(24, 1, 71, 454, 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', 275.7144, 949.1403, 3, NULL, 0, 'http://dummyimage.com/262x343.', 'L', 'Leandra', 'Sherman', 'Nihil quia est eiusm', 'Quasi voluptate eaqu', 'ririhaca', 'Kredi/Banka Kartı', 'Blair Burns', 159, '06-Nov-', 0, 1605043352, '::1', 1, 1, ''),
(25, 1, 71, 406, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 673.4259, 949.1403, 3, NULL, 0, 'http://dummyimage.com/261x344.', 'XL', 'Leandra', 'Sherman', 'Nihil quia est eiusm', 'Quasi voluptate eaqu', 'ririhaca', 'Kredi/Banka Kartı', 'Blair Burns', 159, '06-Nov-', 0, 1605043352, '::1', 1, 1, ''),
(26, 1, 74, 508, 'Elmo Hutchinson', 416.24, 582.8218999999999, 1, NULL, 0, 'assets/images/3193247803IMG_20', 'L', 'Beverly', 'Ross', 'Amet in reprehender', 'Exercitationem susci', 'higehudony', 'Kredi/Banka Kartı', 'Ferdinand Hudson', 562, '08-Oct-', 0, 1605043525, '::1', 1, 1, ''),
(27, 1, 74, 485, 'ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet', 132.252, 582.8218999999999, 1, NULL, 0, 'http://dummyimage.com/267x346.', 'XXL', 'Beverly', 'Ross', 'Amet in reprehender', 'Exercitationem susci', 'higehudony', 'Kredi/Banka Kartı', 'Ferdinand Hudson', 562, '08-Oct-', 0, 1605043525, '::1', 1, 1, ''),
(28, 1, 74, 483, 'ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam', 34.3299, 582.8218999999999, 1, NULL, 0, 'http://dummyimage.com/261x350.', 'L', 'Beverly', 'Ross', 'Amet in reprehender', 'Exercitationem susci', 'higehudony', 'Kredi/Banka Kartı', 'Ferdinand Hudson', 562, '08-Oct-', 0, 1605043525, '::1', 1, 1, ''),
(31, 1, 77, 425, 'non mi integer ac neque duis bibendum morbi non quam', 174.775, 179.375, 2, NULL, 4.6, 'http://dummyimage.com/267x342.', 'XXL', 'Cheyenne', 'Park', 'Accusantium asperior', 'Aspernatur ab porro', 'moxicyvu', 'Kredi/Banka Kartı', 'Allen Macias', 384, '08-Apr-', 0, 1605044799, '::1', 1, 1, ''),
(32, 1, 80, 389, 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla', 231.0511, 818.6684, 1, NULL, 0, 'http://dummyimage.com/267x349.', 'XL', 'Eden', 'Riley', 'Id voluptatibus bea', 'Elit molestiae et n', 'vamafi', 'Kredi/Banka Kartı', 'Germane Frank', 633, '19-May-', 0, 1605044844, '::1', 0, 1, ''),
(33, 1, 80, 207, 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', 234.7625, 818.6684, 1, NULL, 0, 'http://dummyimage.com/270x350.', 'XL', 'Eden', 'Riley', 'Id voluptatibus bea', 'Elit molestiae et n', 'vamafi', 'Kredi/Banka Kartı', 'Germane Frank', 633, '19-May-', 0, 1605044844, '::1', 0, 1, ''),
(34, 1, 80, 120, 'nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla', 352.8548, 818.6684, 2, NULL, 0, 'http://dummyimage.com/270x344.', 'L', 'Eden', 'Riley', 'Id voluptatibus bea', 'Elit molestiae et n', 'vamafi', 'Kredi/Banka Kartı', 'Germane Frank', 633, '19-May-', 0, 1605044844, '::1', 0, 1, ''),
(35, 4, 81, 454, 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', 91.9048, 99.3048, 1, NULL, 7.4, 'http://dummyimage.com/262x343.', 'S', 'Mia', 'Lancaster', 'Praesentium duis id', 'Et ea ipsum culpa', 'rubepiha', 'Kredi/Banka Kartı', 'Mercedes Leon', 361, '02-Jul-', 0, 1605088049, '::1', 0, 0, ''),
(36, 4, 83, 406, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 448.9506, 1549.9862, 2, NULL, 0, 'http://dummyimage.com/261x344.', 'XL', 'Jerry', 'Newton', 'Irure beatae et itaq', 'Sapiente et laudanti', 'sinykato', 'Kredi/Banka Kartı', 'Breanna Workman', 682, '18-May-', 0, 1605088083, '::1', 1, 1, ''),
(37, 4, 83, 498, 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis', 1101.0356, 1549.9862, 4, NULL, 0, 'assets/images/4432448237cv.jpg', 'S', 'Jerry', 'Newton', 'Irure beatae et itaq', 'Sapiente et laudanti', 'sinykato', 'Kredi/Banka Kartı', 'Breanna Workman', 682, '18-May-', 0, 1605088083, '::1', 1, 1, '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoriesid` int(10) UNSIGNED NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` double UNSIGNED NOT NULL,
  `categoriesType` varchar(5) NOT NULL,
  `productBrand` varchar(55) NOT NULL,
  `taxRate` int(2) UNSIGNED NOT NULL,
  `productDescription` text NOT NULL,
  `productimage1` varchar(255) NOT NULL,
  `productimage2` varchar(255) NOT NULL,
  `productimage3` varchar(255) NOT NULL,
  `productimage4` varchar(255) NOT NULL,
  `cargoFee` double UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `totalSaleNumber` int(10) UNSIGNED NOT NULL,
  `numberOfViews` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `categoriesid`, `productName`, `productPrice`, `categoriesType`, `productBrand`, `taxRate`, `productDescription`, `productimage1`, `productimage2`, `productimage3`, `productimage4`, `cargoFee`, `status`, `totalSaleNumber`, `numberOfViews`) VALUES
(1, 4, 'quam suspendisse potenti nullam porttitor lacus at turpis donec posuere', 41.75, 'M', 'Yoveo', 12, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/266x346.', 1.3, 0, 243, 82028),
(2, 8, 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet', 189.76, 'F', 'Gigashots', 12, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 'http://dummyimage.com/265x340.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/263x342.', 4.5, 0, 560, 9553),
(3, 7, 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui', 9.54, 'M', 'Topicstorm', 6, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/264x342.', 'http://dummyimage.com/265x340.', 8.2, 0, 715, 31434),
(4, 5, 'tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis', 129.78, 'M', 'Mycat', 19, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/266x341.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/262x350.', 5.3, 1, 829, 89973),
(5, 12, 'eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a', 128.7, 'F', 'Kwideo', 1, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/268x340.', 'http://dummyimage.com/270x343.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/260x340.', 5.8, 0, 876, 32676),
(6, 16, 'etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non', 105.94, 'F', 'Plambee', 9, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/264x344.', 8.4, 1, 731, 16039),
(7, 3, 'nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed', 124.42, 'M', 'Tekfly', 24, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/267x340.', 8.5, 0, 895, 63493),
(8, 11, 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', 228.25, 'F', 'Wikizz', 14, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/268x344.', 0.6, 1, 36, 28742),
(9, 5, 'luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et', 77.01, 'F', 'Feedfish', 18, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/266x344.', 8.7, 1, 859, 48210),
(10, 2, 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus', 98.16, 'F', 'Topiclounge', 18, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/264x340.', 3.5, 0, 942, 82621),
(11, 12, 'sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', 49.29, 'M', 'Gigaclub', 16, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/261x340.', 3.3, 0, 752, 39126),
(12, 8, 'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede', 54.24, 'F', 'Thoughtsphere', 21, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/269x349.', 6, 0, 826, 92362),
(13, 7, 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', 92.89, 'F', 'Thoughtstorm', 5, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/260x344.', 8.1, 0, 366, 43399),
(14, 11, 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis', 9.74, 'M', 'Quamba', 6, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 'http://dummyimage.com/270x349.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/264x342.', 'http://dummyimage.com/266x345.', 3.1, 1, 659, 26664),
(15, 9, 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 72.94, 'F', 'Trudeo', 12, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/268x348.', 0.3, 0, 67, 90715),
(16, 5, 'aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum', 124.78, 'F', 'Zoonder', 15, 'Donec vitae nisi.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/263x350.', 8.6, 0, 978, 52245),
(17, 1, 'duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo', 110.73, 'F', 'Zoonoodle', 4, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/269x350.', 4.5, 0, 734, 12898),
(18, 11, 'erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac', 162.72, 'F', 'Podcat', 21, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/264x344.', 'http://dummyimage.com/266x347.', 1.9, 1, 400, 71552),
(19, 14, 'eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum', 3.33, 'M', 'Talane', 17, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/263x348.', 1.4, 0, 351, 43514),
(20, 11, 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam', 20.01, 'M', 'Meembee', 25, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/264x341.', 2.6, 1, 856, 27999),
(21, 9, 'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula', 63.69, 'F', 'Thoughtmix', 8, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/264x349.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/266x340.', 4.3, 1, 981, 20486),
(22, 1, 'odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit', 104.95, 'F', 'Meetz', 18, 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/261x345.', 3.3, 1, 805, 47127),
(23, 5, 'platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla', 49.95, 'F', 'Feednation', 7, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/260x347.', 6.3, 0, 298, 34543),
(24, 14, 'ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis', 143.97, 'F', 'Jetwire', 11, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/269x340.', 4.1, 1, 324, 13869),
(25, 5, 'in lacus curabitur at ipsum ac tellus semper interdum mauris', 168.62, 'F', 'Photolist', 16, 'Duis aliquam convallis nunc.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/265x349.', 5.2, 1, 494, 71731),
(26, 8, 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing', 217.09, 'M', 'Brightbean', 21, 'In eleifend quam a odio.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/266x346.', 7.7, 0, 833, 10656),
(27, 14, 'elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus', 176.49, 'F', 'Bubbletube', 12, 'Etiam vel augue.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/270x344.', 2.6, 1, 77, 97416),
(28, 4, 'ut nulla sed accumsan felis ut at dolor quis odio', 74.46, 'M', 'Quinu', 15, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/269x346.', 8.2, 1, 358, 59032),
(29, 9, 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue', 174.61, 'F', 'Lazzy', 17, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/267x344.', 5.1, 0, 754, 78712),
(30, 9, 'faucibus cursus urna ut tellus nulla ut erat id mauris vulputate', 98.68, 'F', 'Topiclounge', 7, 'Morbi ut odio.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/263x350.', 1.1, 0, 534, 91524),
(31, 12, 'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 237.42, 'F', 'Innotype', 21, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/266x343.', 0.4, 0, 837, 79459),
(32, 1, 'augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula', 10.72, 'F', 'Realpoint', 23, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/262x341.', 5.8, 1, 966, 1525),
(33, 3, 'suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris', 244.92, 'F', 'Photobug', 19, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/265x340.', 'http://dummyimage.com/264x345.', 0.5, 0, 860, 357),
(34, 16, 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis', 252.78, 'F', 'Mydeo', 25, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/270x347.', 5.9, 0, 117, 80132),
(35, 13, 'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac', 25.65, 'F', 'Vinder', 17, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/266x345.', 3.8, 0, 109, 76355),
(36, 2, 'congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat', 217.3, 'M', 'Voonte', 19, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/264x350.', 'http://dummyimage.com/270x340.', 8.5, 1, 966, 35317),
(37, 10, 'diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus', 170.88, 'M', 'Podcat', 1, 'Aliquam erat volutpat. In congue.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/264x344.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/262x343.', 1.5, 0, 33, 42033),
(38, 14, 'ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in', 151.21, 'M', 'Quaxo', 20, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/261x343.', 5.2, 1, 265, 28169),
(39, 6, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque', 31.68, 'F', 'Gabspot', 12, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/270x347.', 3.6, 1, 37, 26315),
(40, 6, 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci', 46.22, 'F', 'Eamia', 9, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/264x344.', 5.5, 1, 152, 51513),
(41, 4, 'lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in', 168.54, 'F', 'Zoovu', 19, 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/262x349.', 'http://dummyimage.com/265x346.', 7.6, 0, 363, 78208),
(42, 2, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla', 139.57, 'F', 'Flashset', 25, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/267x342.', 1.1, 0, 486, 82711),
(43, 3, 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet', 138.26, 'F', 'Gigazoom', 21, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/263x350.', 5.7, 0, 165, 43884),
(44, 3, 'integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla', 15.02, 'M', 'Feedmix', 16, 'Nam dui.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/269x344.', 7.6, 1, 262, 29325),
(45, 10, 'ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis', 239.96, 'F', 'Photobug', 16, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/266x341.', 'http://dummyimage.com/262x340.', 6.9, 0, 442, 78915),
(46, 6, 'luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus', 112.45, 'M', 'Fivebridge', 8, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/268x348.', 1.1, 1, 34, 90322),
(47, 7, 'mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse', 78.97, 'M', 'Bubblebox', 9, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/270x347.', 1.4, 0, 292, 33778),
(48, 8, 'bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce', 136.81, 'M', 'Shuffletag', 18, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/264x341.', 6.8, 1, 96, 72369),
(49, 8, 'sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non', 78.48, 'F', 'Zoomdog', 6, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/267x342.', 1.8, 0, 35, 49239),
(50, 2, 'consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia', 138.13, 'F', 'Quinu', 8, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/263x341.', 0.1, 1, 753, 62403),
(51, 15, 'lobortis vel dapibus at diam nam tristique tortor eu pede', 94.74, 'M', 'Pixonyx', 19, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/270x343.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/262x343.', 7.4, 1, 409, 49970),
(52, 4, 'lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus', 240.28, 'M', 'Centidel', 8, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/268x347.', 8.6, 0, 467, 90954),
(53, 5, 'aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue', 188.18, 'M', 'Tagcat', 11, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/262x340.', 0, 1, 797, 62414),
(54, 12, 'quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id', 8.32, 'M', 'Chatterbridge', 17, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 'http://dummyimage.com/270x342.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/267x341.', 3, 0, 953, 63256),
(55, 10, 'primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi', 231.1, 'F', 'Realfire', 25, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/268x340.', 'http://dummyimage.com/260x344.', 1.5, 1, 974, 96962),
(56, 8, 'praesent id massa id nisl venenatis lacinia aenean sit amet justo', 59.07, 'F', 'Rhycero', 15, 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/266x347.', 1.6, 0, 997, 13300),
(57, 6, 'et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus', 35.93, 'F', 'Wikido', 11, 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/270x342.', 'http://dummyimage.com/266x344.', 6.5, 1, 724, 97297),
(58, 4, 'at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu', 24.55, 'M', 'Vimbo', 5, 'Integer ac neque. Duis bibendum.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/263x349.', 7.1, 0, 439, 384),
(59, 4, 'in congue etiam justo etiam pretium iaculis justo in hac habitasse', 106.12, 'M', 'Yabox', 12, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/268x349.', 8.9, 1, 504, 96411),
(60, 15, 'sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at', 177.35, 'M', 'Yodel', 4, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/270x342.', 'http://dummyimage.com/263x347.', 1.1, 0, 641, 79474),
(61, 6, 'purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse', 119.36, 'M', 'Innotype', 9, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/264x345.', 6.6, 0, 726, 24388),
(62, 10, 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et', 94.97, 'F', 'Brainverse', 20, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/264x345.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/267x340.', 3.6, 0, 242, 33402),
(63, 11, 'blandit nam nulla integer pede justo lacinia eget tincidunt eget', 182.59, 'M', 'Realmix', 24, 'Integer ac leo. Pellentesque ultrices mattis odio.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/264x350.', 'http://dummyimage.com/263x350.', 4.8, 1, 201, 74338),
(64, 5, 'quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio', 96.2, 'M', 'Gabspot', 17, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/263x342.', 3.7, 1, 199, 32874),
(65, 10, 'iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum', 34.64, 'F', 'Mynte', 13, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/263x340.', 0.1, 0, 12, 71856),
(66, 9, 'in faucibus orci luctus et ultrices posuere cubilia curae duis', 205.27, 'F', 'Avamm', 20, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/263x348.', 4.9, 0, 257, 90270),
(67, 9, 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', 170.39, 'F', 'Voolith', 3, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/268x344.', 'http://dummyimage.com/268x341.', 8.4, 1, 17, 58558),
(68, 5, 'nunc proin at turpis a pede posuere nonummy integer non velit donec', 212.38, 'F', 'Divavu', 22, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/267x346.', 7.4, 1, 976, 29596),
(69, 7, 'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis', 34.17, 'F', 'Buzzster', 7, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/268x344.', 3.8, 1, 948, 26192),
(70, 7, 'augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum', 170.93, 'M', 'Browseblab', 2, 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/261x347.', 2.5, 0, 59, 16572),
(71, 3, 'ac enim in tempor turpis nec euismod scelerisque quam turpis', 142.39, 'F', 'Avavee', 9, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/263x342.', 2.2, 0, 581, 47022),
(72, 7, 'vivamus in felis eu sapien cursus vestibulum proin eu mi nulla', 18.21, 'M', 'Chatterbridge', 25, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/270x342.', 'http://dummyimage.com/260x345.', 3.2, 0, 563, 32599),
(73, 12, 'leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel', 12.58, 'M', 'Skinte', 8, 'Morbi ut odio.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/262x341.', 0.2, 0, 783, 27864),
(74, 8, 'amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', 143.13, 'M', 'Wikibox', 16, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/270x348.', 3.6, 0, 214, 68768),
(75, 3, 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero', 109.58, 'M', 'Topiczoom', 2, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/260x346.', 4.5, 0, 602, 40263),
(76, 12, 'eros elementum pellentesque quisque porta volutpat erat quisque erat eros', 85.12, 'M', 'Katz', 12, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/265x348.', 8.2, 0, 381, 90635),
(77, 8, 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien', 89.85, 'F', 'Wikibox', 17, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/269x349.', 1.5, 0, 724, 74143),
(78, 8, 'justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse', 167.52, 'F', 'Kare', 24, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/269x341.', 4.9, 1, 639, 99154),
(79, 9, 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 96.6, 'M', 'Skiba', 21, 'Nulla tellus. In sagittis dui vel nisl.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/263x345.', 5, 1, 927, 48329),
(80, 2, 'felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 186.75, 'F', 'DabZ', 9, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/263x341.', 7.4, 1, 982, 81841),
(81, 5, 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut', 1.59, 'F', 'Skiptube', 12, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/267x342.', 5.4, 1, 993, 39043),
(82, 6, 'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet', 55.28, 'M', 'Jayo', 23, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/270x343.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/262x343.', 7.4, 1, 735, 66599),
(83, 12, 'pede libero quis orci nullam molestie nibh in lectus pellentesque at', 122.19, 'F', 'Bluejam', 16, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/263x348.', 5, 0, 391, 65423),
(84, 11, 'non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci', 148.34, 'F', 'Thoughtblab', 16, 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/264x349.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/269x344.', 0.6, 0, 764, 95673),
(85, 12, 'imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit', 235.61, 'M', 'Brainlounge', 24, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/263x344.', 3.2, 0, 366, 46904),
(86, 11, 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis', 117.11, 'F', 'Tagfeed', 12, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/270x349.', 'http://dummyimage.com/265x350.', 2.8, 1, 782, 567),
(87, 5, 'sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum', 239.77, 'M', 'Tavu', 12, 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/265x341.', 1.9, 0, 764, 73644),
(88, 11, 'tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', 142.82, 'F', 'Oyonder', 5, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', 'http://dummyimage.com/264x345.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/268x340.', 1.7, 1, 596, 29662),
(89, 8, 'tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum', 19.97, 'F', 'Abata', 4, 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/270x341.', 6.1, 0, 913, 18486),
(90, 13, 'sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum', 147.96, 'F', 'Skivee', 6, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/270x343.', 4.1, 1, 762, 16684),
(91, 12, 'aliquet maecenas leo odio condimentum id luctus nec molestie sed justo', 179.41, 'M', 'Devify', 20, 'Quisque id justo sit amet sapien dignissim vestibulum.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/260x343.', 7.7, 0, 378, 98729),
(92, 8, 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi', 231.75, 'M', 'Feedfire', 5, 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/270x347.', 0, 1, 215, 81094),
(93, 12, 'ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus', 201.14, 'F', 'Thoughtworks', 25, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/265x340.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/269x345.', 4.3, 0, 809, 37923),
(94, 3, 'tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', 173.89, 'M', 'Jabbersphere', 15, 'Nullam sit amet turpis elementum ligula vehicula consequat.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/262x350.', 3.5, 0, 818, 21185),
(95, 12, 'primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec', 166.21, 'F', 'Mydeo', 5, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/264x348.', 2.5, 0, 206, 14121),
(96, 4, 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent', 210.31, 'F', 'Snaptags', 11, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/263x341.', 7.8, 1, 290, 51589),
(97, 16, 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla', 45.82, 'M', 'Avamm', 9, 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/260x344.', 7.4, 0, 93, 41331),
(98, 2, 'integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus', 104.15, 'M', 'Aimbo', 11, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/266x345.', 9, 0, 527, 42390),
(99, 8, 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo', 87.31, 'F', 'Bubbletube', 20, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/264x344.', 6.5, 1, 946, 98090),
(100, 16, 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in', 172.66, 'M', 'Ainyx', 21, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/266x350.', 8.1, 0, 658, 26075),
(101, 11, 'etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus', 246.77, 'F', 'Jabbersphere', 24, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/260x341.', 6.1, 0, 128, 17803),
(102, 10, 'velit donec diam neque vestibulum eget vulputate ut ultrices vel', 168.46, 'F', 'Blogspan', 5, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/261x350.', 3.6, 0, 49, 25464),
(103, 6, 'lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate', 46.52, 'F', 'Devshare', 3, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/267x350.', 0.5, 0, 934, 80253),
(104, 16, 'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque', 127.81, 'F', 'Ainyx', 19, 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/262x342.', 5.9, 0, 828, 90162),
(105, 12, 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo', 131.77, 'M', 'Blogtag', 4, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/260x344.', 7.7, 0, 414, 31431),
(106, 14, 'praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante', 195.82, 'F', 'Cogilith', 2, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/262x347.', 7.7, 1, 122, 24137),
(107, 9, 'aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra', 199.34, 'M', 'Yakitri', 24, 'Aliquam erat volutpat. In congue. Etiam justo.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/268x344.', 3.9, 0, 614, 89293),
(108, 9, 'tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est', 106.16, 'F', 'Voonyx', 2, 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/269x341.', 5.1, 1, 123, 80219),
(109, 2, 'leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non', 70.58, 'M', 'Skinix', 10, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/266x341.', 'http://dummyimage.com/262x343.', 1, 1, 709, 99144),
(110, 8, 'eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis', 58.74, 'M', 'Eamia', 12, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/267x343.', 4.1, 1, 858, 58738),
(111, 4, 'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat', 179.21, 'M', 'Edgeclub', 12, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/260x344.', 1.2, 0, 275, 54774),
(112, 13, 'vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget', 85.66, 'M', 'Topiclounge', 6, 'Phasellus id sapien in sapien iaculis congue.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/260x340.', 5.6, 0, 300, 5250);
INSERT INTO `products` (`id`, `categoriesid`, `productName`, `productPrice`, `categoriesType`, `productBrand`, `taxRate`, `productDescription`, `productimage1`, `productimage2`, `productimage3`, `productimage4`, `cargoFee`, `status`, `totalSaleNumber`, `numberOfViews`) VALUES
(113, 4, 'quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus', 223.41, 'M', 'Shufflester', 20, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/263x348.', 3.4, 1, 996, 40268),
(114, 10, 'bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce', 89.58, 'M', 'Tambee', 4, 'Vivamus tortor.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/261x348.', 3.4, 1, 830, 54817),
(115, 6, 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi a', 21.59, 'M', 'Oyondu', 3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/262x340.', 1.8, 0, 286, 84218),
(116, 1, 'proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem', 104.1, 'M', 'Gigaclub', 4, 'Integer ac leo. Pellentesque ultrices mattis odio.', 'http://dummyimage.com/270x349.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/268x344.', 0.4, 0, 801, 41472),
(117, 1, 'curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam', 91.02, 'M', 'Oyope', 25, 'Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/261x350.', 3.2, 0, 710, 11044),
(118, 11, 'ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula', 251.11, 'F', 'Blogspan', 7, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/263x344.', 3.3, 0, 708, 87869),
(119, 13, 'semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante', 243.4, 'M', 'Wordtune', 12, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/264x344.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/261x345.', 1.5, 0, 715, 74437),
(120, 10, 'nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla', 161.86, 'F', 'Flashset', 9, 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/261x340.', 4.5, 1, 995, 53069),
(121, 5, 'sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis', 30.62, 'F', 'Avamba', 24, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/268x346.', 0.7, 1, 569, 87079),
(122, 16, 'ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo', 223.29, 'F', 'Voolith', 14, 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/264x344.', 1, 0, 417, 92628),
(123, 15, 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 121.84, 'F', 'Skiba', 12, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/261x348.', 'http://dummyimage.com/267x342.', 0.1, 1, 83, 39985),
(124, 1, 'ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at', 222.61, 'F', 'Yadel', 20, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/269x344.', 0.3, 0, 967, 98364),
(125, 1, 'lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed', 74.57, 'F', 'Skalith', 4, 'Cras in purus eu magna vulputate luctus.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/270x341.', 5.7, 1, 253, 70081),
(126, 7, 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci', 241.59, 'F', 'Fivebridge', 21, 'In congue.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/264x347.', 4.4, 0, 339, 85863),
(127, 7, 'justo eu massa donec dapibus duis at velit eu est congue', 76.7, 'M', 'Kwinu', 12, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/270x340.', 1.1, 1, 939, 32847),
(128, 7, 'in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo', 111.65, 'M', 'Rhynyx', 12, 'Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/268x344.', 'http://dummyimage.com/268x347.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/262x350.', 7.7, 1, 757, 72866),
(129, 16, 'ut at dolor quis odio consequat varius integer ac leo', 224.66, 'F', 'Blogpad', 23, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/265x340.', 0.1, 0, 608, 43633),
(130, 15, 'urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec', 153.81, 'M', 'Wikivu', 9, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/260x348.', 4.6, 0, 542, 37746),
(131, 4, 'pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum', 244.39, 'M', 'Youfeed', 3, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/268x348.', 6.9, 0, 626, 34821),
(132, 8, 'sed interdum venenatis turpis enim blandit mi in porttitor pede', 79.42, 'F', 'Vimbo', 1, 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/262x341.', 6.6, 0, 160, 89161),
(133, 6, 'viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien', 226.01, 'F', 'Livetube', 19, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/260x346.', 7.7, 0, 498, 67934),
(134, 5, 'penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis', 114.91, 'M', 'Browseblab', 24, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'http://dummyimage.com/264x344.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/268x341.', 8.4, 0, 148, 68824),
(135, 15, 'ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus', 68.04, 'F', 'Kazu', 11, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/266x347.', 4.8, 0, 18, 10300),
(136, 14, 'velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat', 182.32, 'M', 'Feedfish', 16, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/264x344.', 7.1, 0, 595, 37047),
(137, 1, 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus', 151.35, 'F', 'Gevee', 22, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/270x343.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/261x348.', 8.7, 1, 752, 87893),
(138, 14, 'volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla', 176.22, 'F', 'Jabbertype', 21, 'Donec vitae nisi.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/269x341.', 8.4, 1, 507, 95338),
(139, 9, 'congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec', 88.42, 'F', 'Babbleopia', 23, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/264x348.', 2.1, 1, 681, 52485),
(140, 3, 'augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst', 253.26, 'F', 'Innojam', 7, 'Sed vel enim sit amet nunc viverra dapibus.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/262x346.', 9, 1, 876, 3950),
(141, 12, 'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 143.03, 'F', 'Devshare', 1, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/265x345.', 3.8, 0, 269, 57056),
(142, 5, 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis', 62.44, 'F', 'Bluezoom', 3, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/262x340.', 3.5, 1, 318, 31940),
(143, 7, 'nibh in lectus pellentesque at nulla suspendisse potenti cras in', 111.45, 'M', 'Avamm', 16, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/262x340.', 8.8, 0, 824, 79754),
(144, 11, 'porta volutpat erat quisque erat eros viverra eget congue eget', 2.88, 'M', 'Brainlounge', 5, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/267x340.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/270x344.', 6.3, 1, 556, 59903),
(145, 15, 'potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum', 144.17, 'F', 'Kanoodle', 2, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/266x340.', 4.9, 0, 211, 45681),
(146, 3, 'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel', 231.25, 'M', 'Gabtune', 5, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/260x341.', 3.5, 0, 899, 65827),
(147, 5, 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit', 38.75, 'F', 'Youfeed', 19, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/262x349.', 1, 1, 146, 30324),
(148, 9, 'leo odio porttitor id consequat in consequat ut nulla sed accumsan felis', 252.68, 'F', 'Zoonder', 8, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/269x345.', 3.6, 0, 498, 45020),
(149, 11, 'erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam', 71.67, 'M', 'Fliptune', 25, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/267x340.', 'http://dummyimage.com/267x350.', 7.9, 1, 254, 24321),
(150, 7, 'quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 140.97, 'M', 'Thoughtworks', 4, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/260x346.', 4.7, 0, 906, 30311),
(151, 11, 'ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 168.25, 'F', 'Innotype', 25, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/269x342.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/265x343.', 5.5, 1, 241, 44385),
(152, 9, 'massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', 200.91, 'M', 'Gigaclub', 4, 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/267x340.', 5.3, 0, 664, 70121),
(153, 5, 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor', 227.03, 'F', 'Fivespan', 5, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/260x348.', 3.6, 0, 880, 80575),
(154, 11, 'ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis', 146.79, 'M', 'Skippad', 4, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/260x342.', 7.7, 0, 424, 17960),
(155, 4, 'nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque', 130.62, 'M', 'Browsetype', 16, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/265x342.', 4.5, 0, 33, 89392),
(156, 2, 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', 52.51, 'F', 'Kare', 1, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/266x346.', 6.5, 1, 921, 65193),
(157, 2, 'vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat', 165.92, 'F', 'Katz', 14, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/263x347.', 6.2, 0, 619, 23864),
(158, 8, 'tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit', 195.52, 'M', 'Linklinks', 3, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/264x343.', 8.6, 1, 913, 72255),
(159, 13, 'porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh', 86.9, 'M', 'Babblestorm', 14, 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/269x349.', 5.6, 0, 818, 57356),
(160, 3, 'penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', 219.78, 'F', 'Skinix', 13, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/269x341.', 4.3, 0, 904, 20272),
(161, 4, 'sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat', 104.83, 'F', 'Rhybox', 21, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/264x349.', 7.1, 1, 515, 1731),
(162, 6, 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies', 217.37, 'F', 'Ozu', 1, 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/264x350.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/260x345.', 0.2, 1, 654, 93415),
(163, 15, 'curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia', 39.66, 'F', 'Zoovu', 6, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/264x350.', 1.8, 0, 283, 26760),
(164, 7, 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur', 149.76, 'M', 'Topdrive', 24, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/264x349.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/268x340.', 8.6, 0, 561, 4627),
(165, 14, 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris', 216.46, 'F', 'Edgeclub', 10, 'In hac habitasse platea dictumst.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/265x345.', 1.6, 1, 619, 98558),
(166, 12, 'nisl aenean lectus pellentesque eget nunc donec quis orci eget', 253.56, 'M', 'Roomm', 3, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/263x340.', 2.7, 0, 209, 25760),
(167, 11, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque', 137.96, 'M', 'Zava', 1, 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', 'http://dummyimage.com/262x349.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/269x342.', 'http://dummyimage.com/260x347.', 7.3, 1, 2, 35015),
(168, 15, 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst', 228.7, 'M', 'Zazio', 17, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/264x350.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/262x342.', 5.5, 1, 375, 71892),
(169, 14, 'orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio', 1.56, 'F', 'Skyble', 7, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/267x342.', 'http://dummyimage.com/262x343.', 8.3, 1, 434, 7286),
(170, 3, 'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', 5.62, 'M', 'Trupe', 22, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/265x341.', 5.4, 1, 416, 59817),
(171, 15, 'nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque', 71.12, 'M', 'Topicshots', 13, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/264x343.', 8.8, 0, 974, 36274),
(172, 9, 'eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit', 114.69, 'M', 'Abatz', 5, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/267x345.', 8.6, 1, 596, 75013),
(173, 13, 'libero nam dui proin leo odio porttitor id consequat in consequat ut nulla', 104.36, 'F', 'Yakijo', 5, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/262x349.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/268x340.', 'http://dummyimage.com/265x344.', 6.2, 1, 814, 33348),
(174, 16, 'id ornare imperdiet sapien urna pretium nisl ut volutpat sapien', 212.1, 'F', 'Pixoboo', 14, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/265x340.', 'http://dummyimage.com/269x350.', 3.3, 1, 586, 7012),
(175, 13, 'nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', 94.24, 'F', 'Abata', 25, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/264x342.', 'http://dummyimage.com/263x348.', 7.1, 1, 594, 48975),
(176, 5, 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel', 109.79, 'F', 'Centidel', 8, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/264x346.', 6.8, 0, 673, 2658),
(177, 2, 'rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 190.8, 'F', 'Skyvu', 13, 'In sagittis dui vel nisl.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/260x349.', 1.9, 1, 572, 84708),
(178, 5, 'cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien', 238.12, 'M', 'Realbridge', 1, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/262x349.', 'http://dummyimage.com/261x348.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/260x341.', 7.1, 1, 609, 73285),
(179, 5, 'orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec', 186.64, 'M', 'Browsetype', 19, 'Morbi non lectus.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/264x350.', 8.8, 0, 221, 50017),
(180, 14, 'pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem', 11.57, 'M', 'Browsetype', 25, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/261x347.', 2.1, 1, 267, 71321),
(181, 6, 'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras', 122.04, 'F', 'Devpoint', 15, 'Proin eu mi. Nulla ac enim.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/260x346.', 3.4, 0, 937, 11339),
(182, 4, 'non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac', 26.67, 'M', 'Tazz', 11, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/260x346.', 0.3, 0, 539, 70371),
(183, 1, 'condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet', 89.87, 'F', 'Lazz', 18, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/263x342.', 8.8, 1, 708, 52359),
(184, 12, 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue', 143.33, 'F', 'Vimbo', 6, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/266x347.', 4.9, 0, 276, 45991),
(185, 2, 'in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis', 108.87, 'M', 'Mybuzz', 24, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/265x340.', 'http://dummyimage.com/270x342.', 8.8, 0, 251, 57937),
(186, 12, 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam', 35.92, 'M', 'Viva', 12, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/270x346.', 2.2, 0, 34, 19793),
(187, 9, 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla', 132.9, 'M', 'Photofeed', 11, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/261x342.', 0.9, 0, 890, 72919),
(188, 5, 'dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae', 66.27, 'F', 'Pixoboo', 5, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/266x347.', 8.8, 1, 72, 24403),
(189, 14, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi', 6.22, 'M', 'Skipfire', 12, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/269x342.', 'http://dummyimage.com/264x349.', 1.8, 0, 816, 84734),
(190, 13, 'ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac', 170.65, 'M', 'Chatterbridge', 18, 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/269x345.', 8.2, 0, 739, 57409),
(191, 3, 'enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue', 81.4, 'F', 'Gabcube', 20, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/260x340.', 3.1, 0, 167, 75345),
(192, 1, 'praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus', 3.58, 'M', 'Zoombox', 4, 'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/264x345.', 5.1, 0, 581, 37768),
(193, 12, 'dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis', 176.96, 'F', 'Vidoo', 8, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/264x345.', 8.7, 0, 715, 7367),
(194, 2, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 156.64, 'M', 'Voonyx', 13, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/262x342.', 2, 0, 22, 70021),
(195, 16, 'et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at', 205.58, 'F', 'Lazz', 4, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/268x344.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/262x344.', 5.4, 0, 365, 30848),
(196, 10, 'lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in', 125.75, 'M', 'Riffpath', 15, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/266x348.', 4.9, 0, 374, 26947),
(197, 12, 'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus', 220.88, 'F', 'Trilith', 18, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/263x345.', 7.5, 0, 560, 12822),
(198, 6, 'eu nibh quisque id justo sit amet sapien dignissim vestibulum', 45.27, 'F', 'Wordpedia', 4, 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/267x342.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/263x341.', 2.8, 1, 779, 1566),
(199, 1, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue', 13.09, 'F', 'Wordtune', 18, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/268x346.', 0.6, 0, 381, 47693),
(200, 5, 'imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis', 155.08, 'F', 'Rhynyx', 22, 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/269x346.', 3.5, 1, 743, 26979),
(201, 8, 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti', 104.92, 'M', 'Buzzbean', 16, 'Aenean lectus.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/267x343.', 3.8, 0, 678, 31779),
(202, 9, 'eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero', 95.41, 'M', 'Buzzster', 7, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/265x340.', 2, 1, 534, 19222),
(203, 5, 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur', 33.44, 'M', 'Meevee', 14, 'Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/269x341.', 4.7, 0, 440, 75329),
(204, 5, 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at', 49.44, 'F', 'Avamba', 2, 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/264x345.', 0.2, 0, 288, 57611),
(205, 2, 'tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc', 218.28, 'F', 'Twitterlist', 22, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/268x340.', 0.6, 0, 985, 35171),
(206, 12, 'maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi', 67.12, 'M', 'Aibox', 20, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/264x344.', 'http://dummyimage.com/262x349.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/270x348.', 1.5, 0, 349, 26671),
(207, 10, 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', 187.81, 'F', 'Dablist', 25, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/267x340.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/268x345.', 3.6, 1, 116, 91836),
(208, 13, 'et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat', 207.86, 'M', 'Gabspot', 15, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/270x346.', 7.1, 0, 869, 98737),
(209, 16, 'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non', 253.66, 'F', 'Dynava', 22, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/269x341.', 5.6, 0, 429, 27064),
(210, 2, 'cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor', 149.14, 'M', 'Omba', 25, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/269x349.', 8.7, 1, 1, 25991),
(211, 8, 'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', 6.46, 'M', 'Camido', 15, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/270x342.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/265x341.', 1.2, 1, 551, 1306),
(212, 9, 'porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac', 130.59, 'M', 'Podcat', 11, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/267x346.', 8.8, 0, 766, 12548),
(213, 9, 'amet eros suspendisse accumsan tortor quis turpis sed ante vivamus', 69.76, 'M', 'Thoughtblab', 9, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/264x345.', 'http://dummyimage.com/265x341.', 6.3, 1, 843, 70671),
(214, 2, 'viverra eget congue eget semper rutrum nulla nunc purus phasellus in', 251.33, 'F', 'Meevee', 6, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/266x349.', 6.8, 0, 93, 9769),
(215, 14, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam', 163.58, 'M', 'Nlounge', 1, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/262x342.', 3.8, 1, 919, 39691),
(216, 13, 'cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla', 108.17, 'M', 'Realblab', 18, 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/267x340.', 'http://dummyimage.com/261x350.', 5.5, 1, 634, 93301),
(217, 12, 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit', 203.89, 'M', 'Gabtype', 20, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/260x346.', 3.8, 0, 713, 15611),
(218, 12, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus', 173.41, 'M', 'Thoughtstorm', 8, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/269x349.', 4.6, 0, 626, 18438),
(219, 14, 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi', 59.92, 'F', 'Aimbo', 25, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 'http://dummyimage.com/267x340.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/262x350.', 5.1, 1, 225, 11390),
(220, 12, 'non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', 164.67, 'F', 'Oyoyo', 12, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/264x344.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/260x348.', 0.1, 0, 682, 6774),
(221, 5, 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 6.77, 'M', 'Realbridge', 14, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/270x340.', 5.4, 0, 601, 68445),
(222, 3, 'eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in', 236.91, 'F', 'Vipe', 20, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/268x341.', 4.8, 1, 59, 82369);
INSERT INTO `products` (`id`, `categoriesid`, `productName`, `productPrice`, `categoriesType`, `productBrand`, `taxRate`, `productDescription`, `productimage1`, `productimage2`, `productimage3`, `productimage4`, `cargoFee`, `status`, `totalSaleNumber`, `numberOfViews`) VALUES
(223, 15, 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula', 1.86, 'M', 'Thoughtsphere', 11, 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/262x340.', 5.4, 0, 931, 53887),
(224, 3, 'in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', 97.24, 'F', 'Kaymbo', 21, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/263x341.', 1.9, 0, 340, 23573),
(225, 11, 'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum', 216.23, 'M', 'Skimia', 2, 'Integer non velit.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/270x342.', 2.5, 0, 333, 29887),
(226, 1, 'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', 43.09, 'M', 'Latz', 8, 'Nulla ut erat id mauris vulputate elementum. Nullam varius.', 'http://dummyimage.com/270x343.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/264x341.', 4.7, 0, 469, 57959),
(227, 13, 'accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque', 80.05, 'F', 'Zava', 9, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/262x343.', 5.1, 1, 341, 19980),
(228, 7, 'in libero ut massa volutpat convallis morbi odio odio elementum eu interdum', 105.36, 'M', 'Gabvine', 12, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/264x344.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/263x343.', 0.4, 1, 374, 16476),
(229, 8, 'elementum nullam varius nulla facilisi cras non velit nec nisi', 131.02, 'F', 'Twinder', 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/262x342.', 1.2, 1, 363, 15022),
(230, 3, 'blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem', 219.11, 'F', 'Livepath', 22, 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/268x343.', 6.7, 1, 133, 64854),
(231, 2, 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel', 139.47, 'M', 'Eare', 24, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/264x350.', 'http://dummyimage.com/263x342.', 7.6, 1, 488, 59303),
(232, 14, 'quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut', 135.49, 'M', 'Rhybox', 24, 'Sed sagittis.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/262x344.', 7, 0, 678, 31127),
(233, 7, 'sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', 87.94, 'F', 'Trilia', 7, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/264x340.', 7.7, 1, 239, 5190),
(234, 15, 'enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus', 164.73, 'F', 'Trilith', 12, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/262x343.', 3.1, 1, 349, 25054),
(235, 14, 'nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh', 137.68, 'F', 'Quatz', 15, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/264x349.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/260x348.', 2.4, 1, 24, 45048),
(236, 13, 'eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 212.98, 'M', 'Zoombeat', 22, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/261x342.', 2.3, 1, 796, 81911),
(237, 6, 'leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis', 187.32, 'F', 'Kwideo', 10, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/261x341.', 4.4, 0, 6, 64086),
(238, 12, 'mauris non ligula pellentesque ultrices phasellus id sapien in sapien', 165.19, 'F', 'Skyba', 8, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/262x347.', 1.2, 0, 844, 45294),
(239, 7, 'in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt', 118.86, 'M', 'Geba', 7, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/261x348.', 0.3, 0, 286, 50453),
(240, 4, 'lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus', 94.59, 'M', 'Flashset', 18, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/264x346.', 5.8, 0, 565, 77390),
(241, 2, 'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id', 214.94, 'F', 'Photobug', 13, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/266x348.', 7.5, 1, 536, 68770),
(242, 16, 'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae', 100.69, 'F', 'Voonder', 7, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/268x347.', 'http://dummyimage.com/264x347.', 7.9, 0, 114, 59140),
(243, 15, 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit', 99.88, 'M', 'Fiveclub', 17, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/266x340.', 8.1, 0, 281, 47965),
(244, 3, 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 167.56, 'F', 'Jabberstorm', 21, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/263x348.', 8.4, 0, 678, 40165),
(245, 1, 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing', 237.81, 'M', 'Aimbu', 3, 'Nullam varius. Nulla facilisi.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/267x350.', 8.8, 0, 447, 32578),
(246, 12, 'lectus in est risus auctor sed tristique in tempus sit amet', 211.7, 'M', 'Janyx', 1, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/262x341.', 0.2, 0, 156, 37274),
(247, 16, 'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus', 61.5, 'F', 'DabZ', 11, 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/261x349.', 6.1, 1, 868, 92890),
(248, 6, 'varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 167.04, 'F', 'Snaptags', 6, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/264x345.', 'http://dummyimage.com/263x342.', 1.8, 0, 22, 96044),
(249, 4, 'duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a', 224.09, 'M', 'Katz', 7, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/264x345.', 'http://dummyimage.com/267x347.', 8.7, 1, 135, 3491),
(250, 10, 'est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis', 94.08, 'F', 'Oyoyo', 4, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/261x344.', 3.8, 0, 671, 11017),
(251, 3, 'cursus urna ut tellus nulla ut erat id mauris vulputate elementum', 152.14, 'F', 'Kanoodle', 7, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/260x348.', 8.5, 0, 543, 76723),
(252, 8, 'felis sed interdum venenatis turpis enim blandit mi in porttitor pede', 155.59, 'F', 'Thoughtsphere', 4, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/269x344.', 4.4, 1, 942, 96824),
(253, 14, 'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante', 227.49, 'M', 'Babbleopia', 10, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/263x350.', 5.1, 1, 925, 71659),
(254, 14, 'consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam', 247.78, 'F', 'Rhycero', 12, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/268x344.', 'http://dummyimage.com/268x347.', 5.4, 0, 226, 15478),
(255, 12, 'in felis donec semper sapien a libero nam dui proin leo odio porttitor', 198.36, 'M', 'Ntag', 12, 'Duis at velit eu est congue elementum.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/264x341.', 5.5, 0, 698, 80156),
(256, 7, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus', 168.66, 'M', 'Roodel', 21, 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/263x348.', 3.8, 0, 744, 30823),
(257, 3, 'vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 251.13, 'M', 'Skibox', 5, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/269x342.', 5.7, 0, 157, 3349),
(258, 12, 'at velit eu est congue elementum in hac habitasse platea dictumst morbi', 249.92, 'F', 'Innotype', 1, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/265x343.', 5.5, 0, 960, 86092),
(259, 1, 'blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse', 120.26, 'M', 'Linklinks', 10, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/262x349.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/260x342.', 7.4, 1, 908, 56786),
(260, 3, 'dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in', 58.62, 'F', 'Mita', 8, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/261x340.', 3.7, 1, 390, 79485),
(261, 1, 'odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla', 102.86, 'M', 'Fivebridge', 25, 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', 'http://dummyimage.com/266x341.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/267x341.', 1.5, 0, 109, 4232),
(262, 4, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio', 69.69, 'M', 'Npath', 1, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/261x345.', 3.5, 1, 137, 43018),
(263, 8, 'curabitur gravida nisi at nibh in hac habitasse platea dictumst', 30, 'M', 'Wikivu', 15, 'Fusce consequat.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/265x345.', 7.1, 0, 98, 54156),
(264, 4, 'sit amet cursus id turpis integer aliquet massa id lobortis', 107.19, 'F', 'Tagtune', 12, 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/264x350.', 1, 0, 370, 22003),
(265, 2, 'eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper', 60.36, 'F', 'Gevee', 3, 'Sed sagittis.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/265x346.', 0.1, 0, 19, 2547),
(266, 8, 'sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh', 216.54, 'M', 'Tagtune', 8, 'Quisque ut erat. Curabitur gravida nisi at nibh.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/260x347.', 3.3, 0, 114, 73165),
(267, 5, 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi', 157.15, 'F', 'Devshare', 5, 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/269x349.', 3.4, 0, 640, 44205),
(268, 8, 'aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non', 52.85, 'F', 'Thoughtstorm', 16, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/264x344.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/264x342.', 3.2, 1, 597, 95645),
(269, 13, 'ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero', 38.6, 'F', 'Realcube', 7, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/265x341.', 1.1, 1, 923, 39924),
(270, 16, 'mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in', 10.66, 'F', 'Fivechat', 9, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/264x349.', 2.3, 1, 964, 97918),
(271, 8, 'ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', 90.16, 'M', 'Plambee', 12, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/268x345.', 2.6, 0, 734, 97401),
(272, 5, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id', 8.26, 'M', 'Plambee', 9, 'Morbi ut odio.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/267x350.', 3.6, 1, 961, 80433),
(273, 3, 'orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi', 78.06, 'M', 'Tazz', 22, 'Donec posuere metus vitae ipsum.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/266x341.', 'http://dummyimage.com/268x340.', 'http://dummyimage.com/270x341.', 2, 1, 847, 30803),
(274, 2, 'lobortis est phasellus sit amet erat nulla tempus vivamus in', 154.94, 'F', 'Twinte', 1, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/267x340.', 3.7, 1, 47, 82492),
(275, 11, 'mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec', 247.81, 'M', 'Fliptune', 22, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/268x344.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/264x342.', 6.4, 0, 254, 37990),
(276, 6, 'ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit', 184.39, 'M', 'Photobug', 21, 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/267x348.', 5.7, 0, 7, 54075),
(277, 2, 'eu magna vulputate luctus cum sociis natoque penatibus et magnis dis', 41.04, 'M', 'Yoveo', 7, 'Phasellus id sapien in sapien iaculis congue.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/261x341.', 4.6, 0, 885, 58546),
(278, 8, 'amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 170.01, 'F', 'Blogspan', 24, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/269x346.', 2.7, 1, 964, 91615),
(279, 9, 'ac nibh fusce lacus purus aliquet at feugiat non pretium', 239.85, 'F', 'Ozu', 15, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'http://dummyimage.com/264x350.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/260x346.', 0.5, 1, 315, 58419),
(280, 4, 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus', 196.63, 'M', 'Linkbuzz', 3, 'Praesent lectus.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/270x346.', 0.3, 0, 281, 51831),
(281, 15, 'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi', 130.09, 'M', 'Blogspan', 8, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/265x344.', 6.7, 1, 491, 25870),
(282, 12, 'quam nec dui luctus rutrum nulla tellus in sagittis dui vel', 117.41, 'F', 'Meedoo', 21, 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/269x350.', 5.6, 0, 987, 62455),
(283, 10, 'cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim', 206.3, 'F', 'Gigashots', 9, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/261x341.', 8.5, 0, 84, 71010),
(284, 8, 'vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur', 31.13, 'M', 'Bubblebox', 8, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/269x343.', 6.6, 0, 901, 49134),
(285, 13, 'vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper', 33.03, 'M', 'Youtags', 6, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/261x350.', 8.7, 1, 548, 83148),
(286, 1, 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 236.95, 'M', 'Shufflebeat', 16, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/260x348.', 8.2, 0, 782, 79089),
(287, 4, 'tristique in tempus sit amet sem fusce consequat nulla nisl', 153.97, 'M', 'Jabbercube', 4, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/263x349.', 5.9, 1, 597, 31378),
(288, 4, 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in', 197.22, 'M', 'Yamia', 25, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/264x340.', 4.5, 1, 304, 87791),
(289, 5, 'ligula in lacus curabitur at ipsum ac tellus semper interdum', 10.73, 'M', 'Meevee', 3, 'Aliquam erat volutpat. In congue. Etiam justo.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/267x350.', 7.5, 0, 270, 5744),
(290, 4, 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci', 27.83, 'F', 'Kwideo', 17, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/270x348.', 1.8, 1, 607, 8111),
(291, 14, 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh', 186.73, 'F', 'Tagpad', 3, 'Donec semper sapien a libero.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/264x342.', 7.9, 1, 863, 94061),
(292, 8, 'congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero', 104.88, 'F', 'Trudoo', 18, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/266x350.', 4.3, 0, 846, 671),
(293, 14, 'orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut', 143.4, 'F', 'Livepath', 14, 'Aenean lectus.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/266x343.', 5.3, 0, 344, 97739),
(294, 8, 'eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante', 227.19, 'M', 'Latz', 9, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/266x350.', 3, 0, 259, 29031),
(295, 14, 'in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', 107.94, 'M', 'Oyoloo', 8, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/260x344.', 8.3, 1, 808, 34296),
(296, 16, 'felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', 199.18, 'F', 'Yabox', 15, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/266x340.', 5.8, 1, 912, 61416),
(297, 1, 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh', 180.03, 'M', 'DabZ', 13, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/265x340.', 7.6, 1, 779, 70059),
(298, 10, 'turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel', 195.31, 'F', 'DabZ', 8, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/262x349.', 6.9, 0, 546, 76628),
(299, 9, 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc', 154.22, 'M', 'Tagtune', 6, 'Phasellus sit amet erat. Nulla tempus.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/267x345.', 3.9, 1, 389, 2855),
(300, 16, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo', 97.36, 'F', 'Eabox', 8, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/262x347.', 3.6, 0, 494, 46277),
(301, 6, 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque', 193.68, 'F', 'Jabbertype', 5, 'Proin risus.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/270x343.', 7.1, 1, 76, 30384),
(302, 6, 'in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', 135.57, 'F', 'Meejo', 19, 'Nam dui.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/267x342.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/263x346.', 7.8, 1, 726, 82345),
(303, 1, 'in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec', 47.48, 'M', 'Vinte', 8, 'Pellentesque at nulla.', 'http://dummyimage.com/270x349.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/261x343.', 1.3, 0, 415, 56371),
(304, 15, 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam', 46.96, 'M', 'Dablist', 15, 'Ut tellus. Nulla ut erat id mauris vulputate elementum.', 'http://dummyimage.com/270x349.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/269x349.', 8.4, 1, 245, 54452),
(305, 1, 'nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque', 138.15, 'F', 'Bubblebox', 23, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/263x350.', 1.4, 1, 148, 29124),
(306, 9, 'dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue', 173.04, 'F', 'Vidoo', 16, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/270x349.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/268x344.', 1.6, 1, 716, 39850),
(307, 12, 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur', 234.86, 'F', 'Jabbersphere', 2, 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/267x342.', 4.5, 0, 512, 6228),
(308, 11, 'tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus', 108.31, 'M', 'Linktype', 23, 'In eleifend quam a odio.', 'http://dummyimage.com/264x345.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/267x346.', 7.4, 1, 606, 3265),
(309, 11, 'nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel', 60.28, 'F', 'Fivebridge', 15, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/260x348.', 7.8, 1, 628, 20018),
(310, 6, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis', 78.56, 'M', 'Gigazoom', 6, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/260x344.', 8.5, 0, 35, 47449),
(311, 15, 'hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec', 97.19, 'F', 'Realpoint', 14, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/270x344.', 8.7, 0, 412, 27303),
(312, 8, 'lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', 172.46, 'F', 'Livetube', 23, 'Nullam molestie nibh in lectus.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/261x349.', 5.2, 1, 801, 45282),
(313, 2, 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut', 9.08, 'M', 'Livepath', 25, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/270x349.', 5.8, 1, 646, 65496),
(314, 3, 'sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus', 13.75, 'M', 'Edgeclub', 1, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/263x342.', 3.7, 0, 172, 78810),
(315, 6, 'curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero', 174.64, 'M', 'Twitterbridge', 15, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/267x347.', 0.3, 0, 703, 14181),
(316, 4, 'ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec', 82.22, 'M', 'Oyoyo', 5, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/260x341.', 2.5, 1, 113, 23505),
(317, 13, 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla', 182.87, 'M', 'Eidel', 19, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/267x340.', 7.1, 1, 635, 13831),
(318, 14, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque', 121.25, 'F', 'Bubbletube', 22, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/262x344.', 0.7, 1, 910, 13893),
(319, 1, 'vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id', 242.25, 'F', 'Meejo', 6, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/270x341.', 6.2, 0, 485, 12184),
(320, 10, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', 60.38, 'F', 'Meetz', 16, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/269x342.', 2.4, 0, 391, 53138),
(321, 11, 'ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede', 61.71, 'M', 'Kaymbo', 1, 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/269x342.', 4, 0, 434, 28459),
(322, 14, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing', 161.72, 'F', 'Devpulse', 23, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/260x341.', 5.6, 0, 713, 82183),
(323, 12, 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante', 15.12, 'M', 'Eimbee', 17, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/265x340.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/267x347.', 0.6, 0, 486, 74527),
(324, 1, 'est donec odio justo sollicitudin ut suscipit a feugiat et eros', 42.24, 'M', 'Jaxbean', 24, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/261x346.', 5.2, 0, 772, 38950),
(325, 11, 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl', 107.25, 'F', 'Gabtype', 14, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/266x347.', 8.4, 1, 121, 85282),
(326, 10, 'convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas', 73.07, 'M', 'Ozu', 2, 'Integer ac neque.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/261x341.', 1.6, 0, 139, 16855),
(327, 7, 'id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo', 24.77, 'M', 'Topdrive', 7, 'Donec posuere metus vitae ipsum.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/268x346.', 0.8, 0, 563, 51631),
(328, 2, 'curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque', 241.77, 'F', 'Voonix', 21, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'http://dummyimage.com/264x350.', 'http://dummyimage.com/268x344.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/260x342.', 6.9, 0, 910, 91918),
(329, 6, 'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus', 170.04, 'M', 'Jabbercube', 11, 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/265x341.', 8.6, 0, 312, 46989),
(330, 3, 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget', 194.44, 'M', 'Yotz', 8, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/267x342.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/269x340.', 8.2, 0, 853, 39174),
(331, 10, 'lorem id ligula suspendisse ornare consequat lectus in est risus auctor', 217.32, 'M', 'Pixope', 2, 'Morbi ut odio.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/265x345.', 5.7, 0, 725, 1576),
(332, 8, 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', 208.46, 'F', 'Topicware', 22, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/270x343.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/265x348.', 8.7, 1, 686, 98005),
(333, 14, 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', 206.17, 'F', 'Linklinks', 22, 'Cras non velit nec nisi vulputate nonummy.', 'http://dummyimage.com/261x348.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/265x340.', 'http://dummyimage.com/267x350.', 5.7, 1, 437, 2883),
(334, 2, 'quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci', 19.97, 'M', 'Rhyloo', 21, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/262x343.', 6.8, 0, 764, 24321),
(335, 4, 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet', 243.06, 'F', 'Wikizz', 23, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/263x340.', 8.9, 1, 6, 97262),
(336, 4, 'massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea', 170.11, 'F', 'Snaptags', 24, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/264x340.', 0.6, 1, 513, 39099),
(337, 11, 'libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis', 202.88, 'M', 'Quinu', 21, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/261x342.', 7.5, 0, 741, 39422),
(338, 12, 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse', 70.88, 'F', 'Pixonyx', 17, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/264x341.', 5.8, 0, 216, 631);
INSERT INTO `products` (`id`, `categoriesid`, `productName`, `productPrice`, `categoriesType`, `productBrand`, `taxRate`, `productDescription`, `productimage1`, `productimage2`, `productimage3`, `productimage4`, `cargoFee`, `status`, `totalSaleNumber`, `numberOfViews`) VALUES
(339, 12, 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 1.25, 'M', 'Oyoba', 17, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/262x350.', 4.5, 0, 888, 33217),
(340, 9, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', 35.47, 'M', 'Skinte', 21, 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/260x348.', 2.7, 0, 17, 18902),
(341, 14, 'accumsan odio curabitur convallis duis consequat dui nec nisi volutpat', 27.37, 'F', 'Lazzy', 8, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/268x344.', 'http://dummyimage.com/269x345.', 2.8, 0, 418, 4719),
(342, 13, 'imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit', 214.77, 'M', 'Realcube', 12, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/269x342.', 8.7, 1, 274, 34997),
(343, 11, 'praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante', 190.93, 'F', 'Trunyx', 10, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/267x343.', 8, 0, 250, 42878),
(344, 10, 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla', 1.24, 'F', 'Kayveo', 3, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'http://dummyimage.com/264x345.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/268x347.', 'http://dummyimage.com/266x350.', 6.4, 0, 721, 50120),
(345, 4, 'nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis', 51.56, 'M', 'Skimia', 21, 'Maecenas ut massa quis augue luctus tincidunt.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/262x345.', 6.4, 0, 264, 84087),
(346, 15, 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel', 167.72, 'F', 'Vidoo', 7, 'Suspendisse potenti.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/267x341.', 4.8, 0, 104, 45431),
(347, 9, 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin', 191.91, 'M', 'Mita', 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/262x350.', 3.3, 0, 204, 15758),
(348, 2, 'blandit mi in porttitor pede justo eu massa donec dapibus duis', 73.54, 'F', 'Kwinu', 7, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/264x341.', 7.3, 1, 348, 55709),
(349, 9, 'pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc', 181.07, 'F', 'Blogtags', 24, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/266x342.', 7.9, 0, 396, 44509),
(350, 3, 'lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue', 160.25, 'F', 'Gabcube', 11, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/263x346.', 8.8, 0, 111, 78918),
(351, 5, 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo', 93.68, 'F', 'Bubblemix', 24, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/261x343.', 7, 1, 38, 44078),
(352, 14, 'tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum', 136.02, 'F', 'Feedbug', 15, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/261x350.', 3.1, 1, 836, 84535),
(353, 15, 'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam', 2.5, 'M', 'Skyble', 14, 'Fusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/261x348.', 'http://dummyimage.com/261x348.', 7.8, 0, 693, 94094),
(354, 4, 'quis orci nullam molestie nibh in lectus pellentesque at nulla', 231.62, 'F', 'Zooxo', 23, 'Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/267x341.', 2.1, 0, 417, 24812),
(355, 2, 'nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt', 69.8, 'F', 'Roodel', 15, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/269x346.', 2.8, 1, 278, 88653),
(356, 14, 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio', 144.61, 'F', 'Oba', 23, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/268x350.', 3.4, 0, 573, 66520),
(357, 11, 'ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 125.69, 'F', 'Avaveo', 15, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/261x346.', 0.6, 1, 982, 28616),
(358, 4, 'ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque', 131.4, 'M', 'Camido', 9, 'Nullam varius.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/261x347.', 4.7, 1, 878, 13790),
(359, 9, 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl', 46.97, 'M', 'Browseblab', 11, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/270x349.', 'http://dummyimage.com/262x349.', 7.7, 0, 583, 50232),
(360, 16, 'eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus', 96.92, 'F', 'Roomm', 17, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/261x342.', 5, 0, 170, 29073),
(361, 6, 'justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', 16.17, 'F', 'Photojam', 24, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/263x347.', 6.1, 0, 796, 80554),
(362, 8, 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel', 127.5, 'F', 'Roombo', 6, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/270x342.', 6, 1, 729, 76483),
(363, 4, 'erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget', 8.49, 'M', 'Jatri', 24, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/260x344.', 8.6, 0, 132, 24634),
(364, 12, 'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna', 69.49, 'M', 'Flipstorm', 25, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/263x343.', 3.7, 0, 154, 31682),
(365, 4, 'dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero', 131.25, 'F', 'Vinte', 19, 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/266x341.', 0.5, 1, 266, 36714),
(366, 12, 'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare', 18, 'M', 'Layo', 11, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/267x341.', 7.4, 0, 176, 97331),
(367, 15, 'cursus urna ut tellus nulla ut erat id mauris vulputate elementum', 153.87, 'F', 'Voonder', 20, 'Integer a nibh. In quis justo.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/264x346.', 0.6, 1, 416, 99866),
(368, 9, 'augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet', 251.88, 'M', 'Skippad', 24, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/268x343.', 2, 1, 232, 78423),
(369, 2, 'turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget', 227.75, 'F', 'Topicshots', 22, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/264x349.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/262x349.', 7.1, 1, 477, 59735),
(370, 3, 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 189.11, 'M', 'Gigabox', 18, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/264x341.', 7.7, 0, 912, 4090),
(371, 4, 'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet', 70.89, 'M', 'Yata', 15, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/267x340.', 'http://dummyimage.com/261x350.', 0.3, 1, 889, 40873),
(372, 5, 'dui luctus rutrum nulla tellus in sagittis dui vel nisl', 200.33, 'M', 'Avamm', 15, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', 'http://dummyimage.com/263x343.', 'http://dummyimage.com/267x342.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/263x344.', 5.1, 1, 893, 69322),
(373, 14, 'porttitor pede justo eu massa donec dapibus duis at velit eu', 63.17, 'F', 'Oyope', 21, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/265x346.', 0.7, 1, 406, 53862),
(374, 11, 'turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy', 238, 'F', 'Realbridge', 24, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/267x347.', 2.1, 1, 774, 27803),
(375, 8, 'blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit', 165.17, 'F', 'Lazzy', 10, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/267x342.', 1, 0, 281, 99952),
(376, 9, 'elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 125.19, 'F', 'Yambee', 20, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/264x342.', 'http://dummyimage.com/260x341.', 6.6, 0, 802, 4703),
(377, 6, 'velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum', 53.24, 'M', 'Gabtune', 18, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/262x347.', 3.4, 1, 920, 9581),
(378, 1, 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc', 77.65, 'M', 'Jaxnation', 16, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/266x350.', 8.7, 0, 223, 26210),
(379, 12, 'semper est quam pharetra magna ac consequat metus sapien ut', 70.12, 'F', 'Brainverse', 4, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/267x342.', 'http://dummyimage.com/262x348.', 'http://dummyimage.com/260x350.', 6.3, 0, 452, 49665),
(380, 15, 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris', 126.74, 'M', 'Photojam', 16, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/264x346.', 8.3, 0, 399, 64255),
(381, 8, 'eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', 186.9, 'F', 'Eazzy', 17, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/268x341.', 0.9, 1, 250, 37471),
(382, 5, 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci', 18.09, 'F', 'Fivechat', 19, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/268x341.', 8.4, 1, 706, 4940),
(383, 1, 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam', 111.78, 'M', 'Vinte', 17, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/268x340.', 'http://dummyimage.com/267x348.', 0.6, 1, 624, 89403),
(384, 11, 'pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at', 131.94, 'F', 'Tagfeed', 22, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/263x344.', 5.2, 1, 249, 69171),
(385, 13, 'malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet', 216.3, 'M', 'Brainlounge', 11, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/262x350.', 4.1, 1, 147, 30073),
(386, 12, 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit', 182.35, 'M', 'Rhynoodle', 11, 'Nam tristique tortor eu pede.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/264x344.', 2.9, 0, 941, 44453),
(387, 1, 'quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis', 137.16, 'F', 'Pixoboo', 9, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/267x343.', 1.9, 1, 466, 41514),
(388, 7, 'sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 135.23, 'F', 'Quimm', 23, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/261x347.', 3.3, 0, 719, 35492),
(389, 10, 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla', 204.47, 'F', 'Lajo', 13, 'Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/264x349.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/263x348.', 4, 1, 626, 85886),
(390, 6, 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur', 91.88, 'M', 'Eayo', 7, 'Praesent blandit lacinia erat.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/265x340.', 7.1, 0, 189, 33157),
(391, 6, 'ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis', 74.99, 'M', 'Mynte', 20, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/261x350.', 1.3, 0, 89, 68279),
(392, 11, 'ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non', 60.04, 'F', 'Yabox', 9, 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/261x347.', 2.9, 0, 272, 27592),
(393, 14, 'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula', 2.95, 'M', 'Linkbridge', 18, 'In blandit ultrices enim.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/266x340.', 0.1, 1, 164, 5527),
(394, 12, 'morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo', 85.7, 'M', 'Thoughtblab', 10, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/267x348.', 'http://dummyimage.com/269x340.', 4.8, 0, 233, 56934),
(395, 8, 'facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt', 105.72, 'M', 'Jatri', 9, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/265x346.', 0.8, 0, 572, 18143),
(396, 10, 'eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque', 116.58, 'F', 'Linklinks', 10, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/264x350.', 2.7, 0, 6, 35320),
(397, 14, 'non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', 233.08, 'M', 'Oloo', 3, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/267x348.', 5.7, 0, 592, 55007),
(398, 3, 'fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis', 176.14, 'F', 'Realcube', 3, 'Integer ac leo.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/265x348.', 1.2, 1, 151, 5757),
(399, 1, 'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', 56.02, 'M', 'Kwilith', 2, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/265x341.', 8, 1, 936, 89690),
(400, 12, 'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse', 30.32, 'F', 'Jaxnation', 14, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/269x343.', 'http://dummyimage.com/263x344.', 2.8, 0, 831, 95085),
(401, 3, 'phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in', 208.54, 'M', 'Photojam', 14, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/260x342.', 8, 1, 610, 28507),
(402, 15, 'risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in', 108.66, 'M', 'LiveZ', 18, 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/270x343.', 'http://dummyimage.com/267x344.', 5.2, 1, 1, 31543),
(403, 4, 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh', 86, 'M', 'Ainyx', 25, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/269x348.', 1.7, 0, 553, 59260),
(404, 13, 'pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu', 118.97, 'M', 'Meetz', 12, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/268x346.', 'http://dummyimage.com/267x346.', 6.2, 1, 520, 88136),
(405, 15, 'congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium', 84.41, 'M', 'Quimba', 22, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/267x340.', 'http://dummyimage.com/262x349.', 1.7, 0, 954, 34204),
(406, 9, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 209.79, 'F', 'Feedbug', 7, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/261x342.', 2.9, 1, 876, 71467),
(407, 7, 'consequat morbi a ipsum integer a nibh in quis justo', 175.83, 'M', 'Wikizz', 6, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/262x342.', 0.9, 1, 798, 97929),
(408, 1, 'erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede', 13.45, 'F', 'Zooveo', 1, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/263x347.', 6.9, 1, 667, 1310),
(409, 4, 'primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti', 75.49, 'F', 'Twitterbeat', 23, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/268x344.', 'http://dummyimage.com/265x349.', 7.3, 1, 934, 50691),
(410, 14, 'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 213.04, 'M', 'Brightbean', 13, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', 'http://dummyimage.com/270x341.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/267x345.', 6.6, 1, 71, 76886),
(411, 12, 'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est', 61.76, 'M', 'Brainsphere', 1, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'http://dummyimage.com/263x345.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/267x346.', 1.8, 0, 220, 54704),
(412, 3, 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes', 85.79, 'M', 'Blognation', 23, 'Curabitur convallis.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/268x350.', 7.7, 0, 19, 51887),
(413, 16, 'pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu', 135.67, 'M', 'Eire', 19, 'Praesent blandit. Nam nulla.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/269x340.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/261x343.', 0.8, 0, 839, 93978),
(414, 16, 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo', 119.65, 'F', 'Cogibox', 7, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/266x348.', 4.6, 0, 702, 68790),
(415, 16, 'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi', 101.74, 'F', 'JumpXS', 20, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/266x341.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/264x344.', 7.8, 0, 670, 91158),
(416, 4, 'elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante', 2.91, 'F', 'Oodoo', 18, 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'http://dummyimage.com/268x347.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/262x344.', 8.4, 0, 966, 68539),
(417, 13, 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante', 247.98, 'M', 'Dynabox', 3, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/265x347.', 4.2, 1, 18, 61712),
(418, 8, 'consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 34.67, 'M', 'Gabspot', 24, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'http://dummyimage.com/264x350.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/261x343.', 3.8, 1, 9, 50270),
(419, 15, 'ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac', 108.61, 'M', 'Photojam', 8, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/263x348.', 2.7, 0, 840, 77966),
(420, 15, 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', 195.26, 'F', 'DabZ', 17, 'Aenean auctor gravida sem.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/262x348.', 0, 0, 915, 37210),
(421, 3, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 172.45, 'F', 'Jabberstorm', 11, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/269x349.', 6.1, 0, 536, 52060),
(422, 1, 'a pede posuere nonummy integer non velit donec diam neque vestibulum', 100.73, 'F', 'Trilith', 12, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/264x347.', 6.4, 0, 519, 42482),
(423, 4, 'turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit', 84.77, 'M', 'Realpoint', 9, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/269x350.', 7.5, 0, 657, 26006),
(424, 12, 'nisl aenean lectus pellentesque eget nunc donec quis orci eget', 196.42, 'M', 'Avaveo', 2, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/265x347.', 1.3, 0, 741, 96213),
(425, 13, 'non mi integer ac neque duis bibendum morbi non quam', 69.91, 'M', 'Skiba', 25, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'http://dummyimage.com/267x342.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/261x350.', 2.3, 1, 410, 8907),
(426, 13, 'eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget', 185.67, 'F', 'Quaxo', 20, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/261x342.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/265x344.', 0.5, 0, 589, 98264),
(427, 2, 'congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat', 120.93, 'F', 'Teklist', 18, 'Phasellus sit amet erat.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/269x343.', 8.4, 1, 838, 96467),
(428, 13, 'in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', 242.03, 'M', 'Zoovu', 17, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/268x343.', 6.7, 1, 235, 96885),
(429, 3, 'lectus in est risus auctor sed tristique in tempus sit amet', 241.07, 'F', 'Feedspan', 10, 'In sagittis dui vel nisl.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/269x344.', 2.5, 0, 650, 83827),
(430, 9, 'vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien', 40.65, 'M', 'Rhynoodle', 3, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/265x343.', 2.5, 0, 229, 79165),
(431, 15, 'tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', 31.88, 'M', 'Dynava', 17, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'http://dummyimage.com/270x342.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/268x347.', 'http://dummyimage.com/264x343.', 2.7, 1, 292, 29809),
(432, 1, 'ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque', 24.95, 'F', 'Twitterbeat', 2, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'http://dummyimage.com/262x341.', 'http://dummyimage.com/261x344.', 'http://dummyimage.com/263x341.', 'http://dummyimage.com/266x344.', 0.7, 0, 619, 48608),
(433, 5, 'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor', 131.37, 'M', 'DabZ', 6, 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/267x350.', 2.2, 0, 487, 94967),
(434, 8, 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 194.9, 'F', 'Oloo', 18, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/262x348.', 5.2, 1, 79, 71686),
(435, 6, 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla', 66.22, 'M', 'Livetube', 11, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/268x345.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/260x346.', 4.3, 1, 425, 64900),
(436, 15, 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum', 80.37, 'M', 'Jabbertype', 10, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/263x348.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/265x345.', 'http://dummyimage.com/270x349.', 6.1, 1, 860, 53067),
(437, 2, 'nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi', 63.51, 'M', 'Ntag', 12, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/270x344.', 5.8, 0, 581, 84500),
(438, 6, 'vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis', 175.33, 'F', 'Realmix', 4, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/263x343.', 5.9, 0, 739, 74042),
(439, 1, 'ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat', 223.98, 'M', 'Meezzy', 23, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'http://dummyimage.com/265x342.', 'http://dummyimage.com/266x343.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/262x350.', 7.4, 0, 258, 75599),
(440, 3, 'ligula nec sem duis aliquam convallis nunc proin at turpis', 46.31, 'M', 'Pixoboo', 11, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/267x343.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/265x342.', 4.3, 1, 386, 95876),
(441, 2, 'et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', 90.88, 'F', 'Yata', 10, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/266x349.', 3, 0, 104, 63451),
(442, 10, 'eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui', 128.49, 'F', 'Youopia', 22, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/270x344.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/261x344.', 1.7, 0, 77, 38084),
(443, 12, 'lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede', 44.79, 'M', 'Photobug', 17, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/266x349.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/261x350.', 6.9, 0, 895, 62484),
(444, 13, 'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus', 110.52, 'M', 'Jaxspan', 6, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/261x348.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/266x348.', 7.3, 1, 961, 48466),
(445, 4, 'in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius', 110.74, 'M', 'Ozu', 4, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/265x344.', 2.7, 1, 4, 98894),
(446, 15, 'semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum', 12.6, 'M', 'Kanoodle', 16, 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/266x348.', 4.3, 1, 252, 7814),
(447, 14, 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum', 234.63, 'M', 'Zoonoodle', 18, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/260x347.', 1.2, 0, 585, 19316),
(448, 7, 'cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris', 205.82, 'M', 'Tagpad', 14, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/266x341.', 'http://dummyimage.com/260x342.', 8.9, 1, 247, 283),
(449, 9, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit', 159.31, 'F', 'Skiptube', 21, 'Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/260x343.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/269x345.', 4.7, 0, 183, 62174),
(450, 10, 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 219.12, 'F', 'Yakijo', 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/264x346.', 0.3, 0, 50, 67878),
(451, 13, 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum', 151.06, 'M', 'Skyble', 22, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', 'http://dummyimage.com/268x350.', 'http://dummyimage.com/262x344.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/266x345.', 0.8, 0, 692, 76929);
INSERT INTO `products` (`id`, `categoriesid`, `productName`, `productPrice`, `categoriesType`, `productBrand`, `taxRate`, `productDescription`, `productimage1`, `productimage2`, `productimage3`, `productimage4`, `cargoFee`, `status`, `totalSaleNumber`, `numberOfViews`) VALUES
(452, 11, 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet', 211.41, 'F', 'Twitterwire', 5, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/267x344.', 'http://dummyimage.com/268x347.', 1.6, 0, 292, 22499),
(453, 15, 'ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', 84.83, 'M', 'Plajo', 23, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/267x340.', 'http://dummyimage.com/270x345.', 'http://dummyimage.com/266x340.', 'http://dummyimage.com/263x349.', 8.9, 1, 334, 98479),
(454, 9, 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', 88.37, 'F', 'Fivebridge', 4, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/266x342.', 'http://dummyimage.com/267x344.', 7.4, 1, 880, 92519),
(455, 14, 'nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque', 168.13, 'M', 'Shuffletag', 7, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'http://dummyimage.com/265x349.', 'http://dummyimage.com/264x342.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/268x341.', 1.8, 1, 589, 5975),
(456, 7, 'fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar', 73.01, 'M', 'Jabbersphere', 22, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', 'http://dummyimage.com/266x350.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/260x342.', 'http://dummyimage.com/267x340.', 5.1, 0, 538, 50714),
(457, 2, 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis', 167.69, 'F', 'Jetpulse', 20, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/264x347.', 'http://dummyimage.com/260x341.', 0.4, 0, 91, 96314),
(458, 15, 'vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra', 251.29, 'F', 'Digitube', 23, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/265x348.', 'http://dummyimage.com/268x341.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/261x347.', 3.4, 1, 218, 56359),
(459, 3, 'eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo', 192.78, 'M', 'Voolith', 23, 'Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/265x343.', 8, 0, 423, 32748),
(460, 7, 'nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque', 133.43, 'M', 'Flipbug', 9, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/266x342.', 1.5, 1, 24, 3731),
(461, 8, 'lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue', 222.6, 'F', 'Edgepulse', 6, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'http://dummyimage.com/264x340.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/263x344.', 1.3, 0, 773, 42992),
(462, 7, 'arcu libero rutrum ac lobortis vel dapibus at diam nam tristique', 40.67, 'M', 'Pixope', 11, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/267x343.', 1.9, 1, 402, 68854),
(463, 8, 'vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a', 143.39, 'M', 'Dabjam', 9, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/263x340.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/267x342.', 5.6, 0, 682, 95487),
(464, 6, 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque', 138.69, 'M', 'Tagopia', 25, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', 'http://dummyimage.com/266x346.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/264x349.', 'http://dummyimage.com/265x347.', 2.4, 0, 538, 36667),
(465, 4, 'pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', 108.93, 'F', 'Kaymbo', 11, 'Sed sagittis.', 'http://dummyimage.com/264x341.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/269x346.', 4.4, 0, 237, 22732),
(466, 15, 'curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien', 14.54, 'F', 'Skipstorm', 8, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/261x348.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/264x347.', 6.3, 0, 137, 45968),
(467, 8, 'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', 48.31, 'F', 'Roodel', 4, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/269x345.', 'http://dummyimage.com/262x342.', 'http://dummyimage.com/269x342.', 2.3, 1, 921, 75808),
(468, 12, 'turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin', 114.85, 'F', 'Skyble', 15, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/266x343.', 9, 0, 355, 11032),
(469, 5, 'duis aliquam convallis nunc proin at turpis a pede posuere nonummy', 154.11, 'F', 'Tanoodle', 3, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 'http://dummyimage.com/262x347.', 'http://dummyimage.com/263x349.', 'http://dummyimage.com/265x341.', 'http://dummyimage.com/265x344.', 3.3, 1, 102, 6882),
(470, 2, 'ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet', 24.72, 'M', 'Camido', 20, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 'http://dummyimage.com/261x348.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/267x347.', 5.7, 0, 218, 25028),
(471, 16, 'magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum', 106.86, 'F', 'Oyondu', 8, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/263x347.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/266x348.', 'http://dummyimage.com/266x346.', 7.9, 0, 803, 60130),
(472, 7, 'nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est', 204.29, 'F', 'Meejo', 3, 'In hac habitasse platea dictumst.', 'http://dummyimage.com/270x346.', 'http://dummyimage.com/270x342.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/267x343.', 6, 1, 0, 96207),
(473, 5, 'eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu', 93.57, 'F', 'Yoveo', 10, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/266x347.', 'http://dummyimage.com/261x343.', 'http://dummyimage.com/264x344.', 0.1, 1, 885, 96619),
(474, 15, 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus', 75.59, 'F', 'Ntag', 17, 'Nullam varius. Nulla facilisi.', 'http://dummyimage.com/260x340.', 'http://dummyimage.com/260x344.', 'http://dummyimage.com/267x350.', 'http://dummyimage.com/264x340.', 3.4, 1, 77, 84433),
(475, 7, 'leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio', 144.56, 'M', 'Skilith', 4, 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', 'http://dummyimage.com/269x347.', 'http://dummyimage.com/261x341.', 'http://dummyimage.com/269x341.', 'http://dummyimage.com/267x347.', 0.6, 0, 600, 5770),
(476, 3, 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula', 200.93, 'F', 'Kazio', 9, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/264x346.', 'http://dummyimage.com/261x346.', 3.2, 0, 370, 77556),
(477, 5, 'at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum', 85.98, 'M', 'Lazzy', 16, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/266x345.', 'http://dummyimage.com/262x349.', 0.5, 0, 604, 85046),
(478, 4, 'cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi', 49.75, 'M', 'Twitterwire', 13, 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'http://dummyimage.com/267x341.', 'http://dummyimage.com/264x343.', 'http://dummyimage.com/265x346.', 'http://dummyimage.com/267x344.', 2.9, 1, 464, 55932),
(479, 16, 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 112.56, 'F', 'Voonyx', 1, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'http://dummyimage.com/267x347.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/268x347.', 'http://dummyimage.com/261x344.', 3.4, 0, 439, 83101),
(480, 16, 'diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis', 204.85, 'F', 'Bubbletube', 5, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/270x347.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/266x348.', 7.3, 0, 383, 61912),
(481, 5, 'aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien', 213.18, 'F', 'BlogXS', 22, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/268x342.', 'http://dummyimage.com/269x346.', 'http://dummyimage.com/262x350.', 'http://dummyimage.com/263x349.', 2.5, 0, 839, 5207),
(482, 2, 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer', 5.42, 'F', 'Browsecat', 12, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/270x350.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/261x347.', 'http://dummyimage.com/265x348.', 0.4, 1, 999, 67345),
(483, 16, 'ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam', 33.33, 'F', 'Thoughtstorm', 3, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 'http://dummyimage.com/261x350.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/264x348.', 'http://dummyimage.com/264x340.', 2.3, 1, 651, 59493),
(484, 4, 'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan', 93.4, 'M', 'Twitterwire', 1, 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 'http://dummyimage.com/267x345.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/269x348.', 'http://dummyimage.com/263x343.', 3.6, 1, 470, 53019),
(485, 16, 'ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet', 128.4, 'F', 'Kimia', 3, 'Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/267x346.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/260x350.', 'http://dummyimage.com/269x346.', 8.2, 1, 319, 63968),
(486, 3, 'magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis', 72.28, 'F', 'Yabox', 5, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/269x350.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/263x346.', 'http://dummyimage.com/269x349.', 1.9, 0, 163, 56170),
(487, 8, 'turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget', 103.71, 'M', 'Zava', 5, 'Aenean auctor gravida sem.', 'http://dummyimage.com/262x340.', 'http://dummyimage.com/260x346.', 'http://dummyimage.com/260x348.', 'http://dummyimage.com/268x350.', 8.1, 0, 784, 69884),
(488, 4, 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien', 148.63, 'M', 'Zoonoodle', 23, 'Proin eu mi.', 'http://dummyimage.com/262x345.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/270x340.', 'http://dummyimage.com/270x346.', 3.4, 0, 629, 78826),
(489, 7, 'primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec', 33.7, 'M', 'Jabberstorm', 9, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/261x345.', 'http://dummyimage.com/260x349.', 5.8, 0, 2, 51582),
(490, 3, 'aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui', 125.23, 'M', 'Thoughtbeat', 21, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/268x348.', 'http://dummyimage.com/261x349.', 'http://dummyimage.com/268x347.', 7.4, 0, 17, 48040),
(491, 11, 'massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis', 203.03, 'M', 'Flipbug', 7, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/264x342.', 'http://dummyimage.com/260x341.', 'http://dummyimage.com/262x346.', 'http://dummyimage.com/270x344.', 5, 0, 424, 33560),
(492, 8, 'risus semper porta volutpat quam pede lobortis ligula sit amet', 111.71, 'M', 'Yakidoo', 12, 'Duis mattis egestas metus.', 'http://dummyimage.com/263x350.', 'http://dummyimage.com/265x343.', 'http://dummyimage.com/260x345.', 'http://dummyimage.com/261x350.', 1.8, 1, 352, 74700),
(493, 16, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices', 39.91, 'F', 'Bubblemix', 11, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'http://dummyimage.com/266x341.', 'http://dummyimage.com/268x349.', 'http://dummyimage.com/261x340.', 'http://dummyimage.com/264x345.', 5.8, 0, 504, 8683),
(494, 14, 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus', 60.05, 'M', 'Twitternation', 12, 'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'http://dummyimage.com/270x342.', 'http://dummyimage.com/265x350.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/260x347.', 3, 0, 567, 86910),
(495, 16, 'in imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 116.27, 'F', 'Eidel', 6, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/269x344.', 'http://dummyimage.com/260x349.', 'http://dummyimage.com/262x343.', 'http://dummyimage.com/265x349.', 6.9, 0, 476, 26039),
(496, 6, 'vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat', 254.16, 'F', 'Divavu', 13, 'Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/265x344.', 'http://dummyimage.com/267x349.', 'http://dummyimage.com/268x343.', 'http://dummyimage.com/270x348.', 4.3, 1, 930, 79656),
(497, 7, 'vivamus tortor duis mattis egestas metus aenean fermentum donec ut', 243.12, 'M', 'Realblab', 11, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'http://dummyimage.com/266x344.', 'http://dummyimage.com/270x348.', 'http://dummyimage.com/260x347.', 'http://dummyimage.com/266x340.', 0.9, 0, 102, 36784),
(498, 18, 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis', 231.31, 'F', 'Jabbersphere', 19, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'assets/images/4432448237cv.jpg', 'assets/images/3991224971cv.jpg', 'assets/images/2262352308IMG_20190705_175805.jpg', 'assets/images/2557132072IMG_20190705_175805.jpg', 5.6, 1, 920, 15245),
(499, 5, 'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est', 69.25, 'F', 'Feednation', 16, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'http://dummyimage.com/263x342.', 'http://dummyimage.com/263x344.', 'http://dummyimage.com/269x349.', 'http://dummyimage.com/269x349.', 3.3, 0, 56, 9176),
(500, 12, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', 242.16, 'M', 'Camimbo', 12, 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/264x345.', 'http://dummyimage.com/265x347.', 'http://dummyimage.com/261x346.', 'http://dummyimage.com/263x346.', 3.9, 0, 107, 57726),
(506, 11, 'Cassady Blair', 171, 'F', 'Eos harum sint neque', 18, 'Illo nemo perspiciat', 'assets/images/4464646148cv.jpg', 'assets/images/4763538218IMG_20190705_175805.jpg', '', '', 3, 0, 0, 0),
(507, 6, 'Brennan Robbins', 654, 'F', 'Rem vitae aut odio v', 7, 'Aut esse nulla exerc', 'assets/images/5272739001cv.jpg', 'assets/images/3707242126IMG_20190705_175805.jpg', 'assets/images/2050024201cv.jpg', 'assets/images/5036042731IMG_20190705_175805.jpg', 1, 0, 0, 4),
(508, 16, 'Elmo Hutchinson', 344, 'M', 'Dignissimos adipisci', 21, 'Dolorem nisi aute su', 'assets/images/3193247803IMG_20190705_175805.jpg', '', '', '', 5, 1, 1, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `SiteTitle` varchar(60) NOT NULL,
  `SiteDescription` varchar(150) NOT NULL,
  `SiteKeywords` varchar(255) NOT NULL,
  `SiteCopyrightText` varchar(255) NOT NULL,
  `SiteLogo` varchar(30) NOT NULL,
  `SiteLink` varchar(255) NOT NULL,
  `SitePhone` varchar(50) NOT NULL,
  `SiteOfficeAddress` varchar(255) NOT NULL,
  `SiteEmailAddress` varchar(50) NOT NULL,
  `SiteEmailPassword` varchar(50) NOT NULL,
  `SiteEmailHostAddress` varchar(255) NOT NULL,
  `Facebook` varchar(255) DEFAULT NULL,
  `Twitter` varchar(255) DEFAULT NULL,
  `Linkedin` varchar(255) DEFAULT NULL,
  `Instagram` varchar(255) DEFAULT NULL,
  `Pinterest` varchar(255) DEFAULT NULL,
  `YouTube` varchar(255) DEFAULT NULL,
  `DolarKuru` double UNSIGNED DEFAULT NULL,
  `EuroKuru` double UNSIGNED DEFAULT NULL,
  `freeShippingDam` double UNSIGNED DEFAULT NULL,
  `ClientID` varchar(100) DEFAULT NULL,
  `StoreKey` varchar(100) DEFAULT NULL,
  `ApiKullanicisi` varchar(100) DEFAULT NULL,
  `ApiSifresi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`id`, `SiteName`, `SiteTitle`, `SiteDescription`, `SiteKeywords`, `SiteCopyrightText`, `SiteLogo`, `SiteLink`, `SitePhone`, `SiteOfficeAddress`, `SiteEmailAddress`, `SiteEmailPassword`, `SiteEmailHostAddress`, `Facebook`, `Twitter`, `Linkedin`, `Instagram`, `Pinterest`, `YouTube`, `DolarKuru`, `EuroKuru`, `freeShippingDam`, `ClientID`, `StoreKey`, `ApiKullanicisi`, `ApiSifresi`) VALUES
(1, 'www.xshop.com', 'xShop', 'Alışveriş için uygun fiyat ve ödeme koşulları ile xshop.com&#039;da.', 'alt giyim, üst giyim , ayakkabı, aksesuarlar', 'Copyright 2019 - xShop - Tüm Hakları Saklıdır.', 'Logo.png', 'http://localhost/php/eticaret1/', '+9000000000000', 'bağcılar istanbul çınar', 'xxx@gmail.com', 'xxx', 'ssl://smtp.gmail.com', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.instagram.com', 'https://www.pinterest.com', 'https://www.youtube.com', 5.28, 6.12, 300, '00000000', '11111111', '3DKullanicim', '3DSifrem');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `id` int(10) UNSIGNED NOT NULL,
  `cartid` int(10) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `productid` int(10) UNSIGNED NOT NULL,
  `productAmount` tinyint(3) UNSIGNED NOT NULL,
  `size` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sizetableamount`
--

CREATE TABLE `sizetableamount` (
  `id` int(10) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `XS` int(11) DEFAULT NULL,
  `S` int(11) DEFAULT NULL,
  `M` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `XL` int(11) DEFAULT NULL,
  `XXL` int(11) DEFAULT NULL,
  `XXXL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `sizetableamount`
--

INSERT INTO `sizetableamount` (`id`, `productid`, `XS`, `S`, `M`, `L`, `XL`, `XXL`, `XXXL`) VALUES
(1, 1, 13, 15, 24, 9, 40, 10, 32),
(2, 2, 13, 49, 32, 13, 29, 43, 3),
(3, 3, 10, 30, 13, 45, 37, 16, 37),
(4, 4, 13, 3, 50, 26, 35, 39, 42),
(5, 5, 8, 43, 6, 48, 41, 47, 37),
(6, 6, 46, 33, 10, 40, 12, 42, 3),
(7, 7, 48, 15, 46, 28, 36, 39, 6),
(8, 8, 50, 31, 4, 18, 28, 42, 24),
(9, 9, 42, 31, 22, 23, 9, 31, 31),
(10, 10, 43, 41, 19, 48, 13, 24, 23),
(11, 11, 21, 47, 42, 16, 45, 1, 5),
(12, 12, 15, 2, 13, 43, 29, 33, 2),
(13, 13, 10, 41, 4, 48, 32, 30, 9),
(14, 14, 37, 20, 10, 31, 34, 22, 47),
(15, 15, 19, 39, 16, 6, 3, 14, 35),
(16, 16, 21, 34, 20, 14, 8, 13, 41),
(17, 17, 26, 8, 2, 35, 23, 38, 31),
(18, 18, 29, 49, 47, 49, 35, 25, 4),
(19, 19, 38, 12, 33, 36, 43, 16, 15),
(20, 20, 38, 19, 36, 10, 4, 38, 1),
(21, 21, 4, 29, 10, 47, 27, 11, 26),
(22, 22, 38, 33, 37, 42, 20, 19, 37),
(23, 23, 23, 12, 49, 31, 37, 17, 43),
(24, 24, 1, 43, 40, 38, 18, 4, 30),
(25, 25, 19, 48, 35, 38, 25, 38, 21),
(26, 26, 38, 23, 1, 16, 43, 10, 6),
(27, 27, 35, 28, 46, 5, 11, 1, 1),
(28, 28, 16, 19, 25, 17, 3, 30, 16),
(29, 29, 40, 45, 40, 44, 34, 5, 43),
(30, 30, 43, 1, 26, 37, 18, 24, 19),
(31, 31, 11, 41, 31, 23, 43, 31, 31),
(32, 32, 9, 3, 4, 41, 48, 24, 6),
(33, 33, 42, 7, 39, 11, 30, 1, 44),
(34, 34, 44, 33, 30, 9, 37, 23, 19),
(35, 35, 2, 12, 46, 40, 39, 20, 26),
(36, 36, 14, 9, 16, 6, 44, 3, 30),
(37, 37, 23, 41, 32, 34, 27, 17, 10),
(38, 38, 50, 12, 46, 35, 33, 33, 22),
(39, 39, 25, 18, 27, 14, 32, 25, 44),
(40, 40, 14, 33, 41, 50, 19, 43, 41),
(41, 41, 46, 34, 21, 35, 43, 37, 45),
(42, 42, 33, 44, 18, 22, 2, 43, 43),
(43, 43, 47, 14, 47, 20, 7, 4, 17),
(44, 44, 23, 13, 31, 37, 41, 38, 7),
(45, 45, 29, 44, 6, 23, 19, 48, 26),
(46, 46, 10, 1, 23, 3, 6, 27, 13),
(47, 47, 30, 44, 49, 14, 30, 45, 1),
(48, 48, 1, 19, 18, 45, 46, 10, 18),
(49, 49, 50, 29, 16, 15, 26, 11, 45),
(50, 50, 34, 6, 35, 20, 30, 13, 31),
(51, 51, 5, 13, 2, 1, 24, 31, 33),
(52, 52, 19, 12, 19, 3, 26, 5, 1),
(53, 53, 31, 43, 27, 13, 27, 22, 49),
(54, 54, 7, 3, 37, 36, 21, 29, 19),
(55, 55, 33, 46, 49, 20, 45, 6, 39),
(56, 56, 32, 12, 8, 47, 49, 44, 48),
(57, 57, 33, 48, 23, 28, 35, 15, 19),
(58, 58, 50, 30, 46, 8, 18, 16, 35),
(59, 59, 28, 41, 11, 19, 24, 13, 18),
(60, 60, 42, 21, 24, 48, 21, 22, 4),
(61, 61, 31, 32, 18, 27, 28, 27, 12),
(62, 62, 21, 43, 36, 14, 28, 21, 18),
(63, 63, 12, 16, 24, 19, 33, 35, 19),
(64, 64, 16, 47, 39, 25, 5, 16, 40),
(65, 65, 36, 36, 19, 27, 41, 24, 39),
(66, 66, 31, 22, 21, 47, 15, 19, 47),
(67, 67, 16, 26, 26, 2, 46, 32, 24),
(68, 68, 34, 10, 40, 14, 7, 36, 15),
(69, 69, 40, 49, 44, 9, 14, 3, 39),
(70, 70, 8, 45, 45, 24, 22, 23, 31),
(71, 71, 38, 4, 18, 14, 44, 37, 10),
(72, 72, 41, 28, 14, 2, 10, 35, 38),
(73, 73, 47, 28, 11, 25, 1, 40, 4),
(74, 74, 1, 21, 43, 24, 47, 46, 3),
(75, 75, 28, 40, 15, 16, 13, 29, 29),
(76, 76, 17, 4, 14, 32, 10, 3, 6),
(77, 77, 18, 37, 28, 43, 27, 21, 44),
(78, 78, 31, 33, 26, 33, 49, 40, 25),
(79, 79, 24, 25, 1, 32, 33, 10, 29),
(80, 80, 50, 23, 7, 49, 47, 36, 39),
(81, 81, 43, 11, 15, 36, 17, 7, 10),
(82, 82, 22, 23, 47, 24, 19, 19, 7),
(83, 83, 44, 14, 36, 8, 47, 37, 38),
(84, 84, 38, 7, 33, 7, 14, 33, 32),
(85, 85, 32, 39, 44, 46, 7, 43, 24),
(86, 86, 18, 12, 15, 50, 24, 5, 4),
(87, 87, 6, 7, 21, 25, 14, 26, 41),
(88, 88, 42, 11, 18, 3, 30, 6, 27),
(89, 89, 1, 22, 21, 22, 31, 33, 8),
(90, 90, 34, 13, 6, 8, 13, 25, 23),
(91, 91, 20, 23, 37, 32, 31, 40, 18),
(92, 92, 42, 30, 14, 29, 1, 4, 18),
(93, 93, 47, 47, 40, 31, 30, 29, 35),
(94, 94, 24, 35, 30, 36, 42, 38, 25),
(95, 95, 1, 34, 43, 44, 27, 32, 15),
(96, 96, 26, 49, 29, 3, 27, 21, 23),
(97, 97, 35, 22, 41, 39, 10, 35, 5),
(98, 98, 14, 46, 28, 2, 20, 25, 50),
(99, 99, 27, 49, 48, 9, 28, 30, 30),
(100, 100, 20, 26, 11, 43, 33, 29, 7),
(101, 101, 10, 35, 4, 33, 43, 20, 8),
(102, 102, 50, 40, 41, 14, 13, 44, 37),
(103, 103, 4, 42, 22, 29, 15, 14, 20),
(104, 104, 41, 6, 1, 15, 23, 24, 15),
(105, 105, 32, 5, 46, 15, 25, 32, 24),
(106, 106, 17, 15, 3, 17, 11, 2, 46),
(107, 107, 29, 28, 5, 39, 23, 1, 31),
(108, 108, 31, 42, 8, 6, 13, 16, 11),
(109, 109, 40, 32, 3, 27, 38, 31, 14),
(110, 110, 22, 24, 44, 43, 17, 11, 37),
(111, 111, 40, 39, 27, 21, 49, 25, 14),
(112, 112, 1, 33, 16, 23, 24, 47, 49),
(113, 113, 28, 33, 26, 45, 46, 50, 37),
(114, 114, 12, 32, 16, 40, 25, 24, 17),
(115, 115, 14, 10, 1, 44, 19, 5, 21),
(116, 116, 11, 24, 19, 42, 42, 46, 33),
(117, 117, 35, 13, 7, 41, 5, 42, 13),
(118, 118, 5, 15, 10, 35, 37, 42, 44),
(119, 119, 34, 31, 38, 23, 3, 19, 7),
(120, 120, 4, 27, 41, 13, 23, 43, 9),
(121, 121, 17, 28, 50, 33, 11, 34, 40),
(122, 122, 49, 30, 46, 46, 45, 43, 1),
(123, 123, 8, 10, 37, 45, 29, 44, 18),
(124, 124, 36, 31, 27, 41, 24, 2, 36),
(125, 125, 7, 18, 36, 9, 14, 30, 13),
(126, 126, 45, 5, 14, 4, 25, 28, 45),
(127, 127, 40, 30, 10, 36, 32, 2, 19),
(128, 128, 23, 43, 10, 12, 48, 38, 50),
(129, 129, 24, 23, 8, 29, 17, 32, 6),
(130, 130, 34, 19, 47, 31, 50, 28, 18),
(131, 131, 46, 18, 50, 5, 6, 38, 44),
(132, 132, 49, 5, 3, 25, 39, 15, 24),
(133, 133, 6, 16, 34, 17, 2, 42, 26),
(134, 134, 25, 17, 36, 36, 6, 45, 43),
(135, 135, 10, 32, 30, 26, 21, 3, 15),
(136, 136, 36, 1, 35, 24, 5, 35, 28),
(137, 137, 27, 16, 35, 45, 14, 47, 46),
(138, 138, 3, 33, 28, 12, 28, 45, 24),
(139, 139, 35, 5, 31, 45, 26, 34, 39),
(140, 140, 11, 42, 11, 21, 33, 39, 30),
(141, 141, 16, 3, 35, 22, 47, 22, 49),
(142, 142, 10, 45, 23, 45, 8, 24, 5),
(143, 143, 38, 43, 32, 9, 29, 28, 22),
(144, 144, 6, 41, 36, 2, 49, 2, 42),
(145, 145, 31, 11, 17, 37, 40, 43, 39),
(146, 146, 49, 40, 17, 46, 46, 47, 26),
(147, 147, 17, 12, 26, 46, 24, 30, 5),
(148, 148, 49, 42, 45, 34, 39, 29, 50),
(149, 149, 7, 50, 32, 45, 25, 35, 44),
(150, 150, 1, 6, 46, 11, 44, 28, 39),
(151, 151, 31, 7, 18, 25, 44, 28, 27),
(152, 152, 2, 28, 38, 24, 47, 11, 2),
(153, 153, 14, 29, 18, 1, 46, 44, 36),
(154, 154, 45, 3, 49, 49, 49, 40, 45),
(155, 155, 19, 36, 5, 12, 10, 10, 48),
(156, 156, 19, 26, 4, 39, 37, 7, 26),
(157, 157, 26, 48, 13, 20, 18, 8, 24),
(158, 158, 13, 12, 16, 40, 20, 5, 16),
(159, 159, 44, 14, 40, 18, 40, 49, 9),
(160, 160, 7, 36, 34, 11, 20, 22, 28),
(161, 161, 45, 17, 40, 24, 18, 30, 29),
(162, 162, 7, 50, 19, 16, 28, 8, 23),
(163, 163, 34, 37, 48, 24, 11, 25, 3),
(164, 164, 48, 1, 43, 20, 40, 37, 7),
(165, 165, 38, 3, 48, 13, 45, 2, 27),
(166, 166, 5, 29, 45, 30, 38, 13, 28),
(167, 167, 29, 10, 26, 46, 10, 39, 8),
(168, 168, 20, 48, 22, 22, 35, 2, 12),
(169, 169, 6, 2, 48, 11, 36, 8, 6),
(170, 170, 40, 21, 17, 20, 20, 42, 45),
(171, 171, 41, 13, 13, 43, 33, 27, 21),
(172, 172, 39, 45, 13, 9, 32, 37, 47),
(173, 173, 11, 25, 47, 35, 48, 38, 39),
(174, 174, 43, 14, 48, 37, 34, 49, 33),
(175, 175, 35, 22, 18, 19, 17, 47, 41),
(176, 176, 20, 15, 31, 27, 3, 49, 12),
(177, 177, 11, 19, 35, 34, 15, 48, 12),
(178, 178, 32, 35, 26, 19, 3, 28, 25),
(179, 179, 33, 6, 39, 3, 30, 50, 31),
(180, 180, 34, 44, 20, 38, 50, 9, 17),
(181, 181, 12, 45, 40, 28, 45, 34, 50),
(182, 182, 25, 44, 49, 18, 22, 33, 44),
(183, 183, 44, 28, 17, 46, 5, 14, 17),
(184, 184, 30, 42, 19, 1, 7, 50, 28),
(185, 185, 30, 43, 37, 27, 33, 31, 9),
(186, 186, 27, 38, 39, 11, 31, 20, 12),
(187, 187, 32, 35, 29, 48, 36, 34, 46),
(188, 188, 37, 33, 17, 5, 21, 16, 35),
(189, 189, 13, 46, 10, 22, 23, 16, 29),
(190, 190, 26, 5, 44, 13, 21, 41, 2),
(191, 191, 48, 13, 36, 45, 35, 36, 7),
(192, 192, 42, 45, 39, 28, 29, 2, 46),
(193, 193, 22, 31, 10, 2, 21, 38, 18),
(194, 194, 34, 32, 6, 5, 34, 43, 45),
(195, 195, 35, 13, 49, 15, 23, 8, 2),
(196, 196, 49, 20, 24, 16, 38, 17, 19),
(197, 197, 21, 22, 40, 33, 43, 16, 35),
(198, 198, 48, 24, 9, 39, 46, 27, 41),
(199, 199, 28, 47, 44, 46, 9, 10, 35),
(200, 200, 16, 33, 6, 7, 43, 46, 45),
(201, 201, 26, 40, 32, 21, 42, 15, 10),
(202, 202, 17, 5, 47, 35, 43, 30, 20),
(203, 203, 24, 12, 46, 21, 39, 3, 32),
(204, 204, 5, 24, 50, 14, 32, 22, 13),
(205, 205, 21, 38, 29, 37, 45, 28, 15),
(206, 206, 41, 42, 10, 50, 40, 16, 20),
(207, 207, 15, 11, 1, 6, 2, 35, 33),
(208, 208, 26, 40, 35, 48, 38, 43, 48),
(209, 209, 46, 42, 25, 22, 35, 4, 2),
(210, 210, 7, 15, 11, 34, 31, 21, 22),
(211, 211, 9, 24, 8, 12, 37, 12, 47),
(212, 212, 4, 50, 35, 2, 42, 9, 3),
(213, 213, 20, 38, 24, 40, 11, 1, 2),
(214, 214, 50, 25, 34, 32, 47, 13, 50),
(215, 215, 50, 28, 28, 12, 18, 44, 28),
(216, 216, 2, 22, 46, 15, 48, 43, 19),
(217, 217, 35, 39, 39, 42, 2, 49, 16),
(218, 218, 28, 35, 29, 30, 8, 45, 5),
(219, 219, 9, 2, 17, 13, 13, 49, 36),
(220, 220, 46, 48, 15, 44, 3, 39, 7),
(221, 221, 9, 14, 16, 14, 15, 10, 10),
(222, 222, 13, 50, 31, 11, 38, 32, 41),
(223, 223, 41, 12, 18, 37, 28, 29, 21),
(224, 224, 15, 24, 19, 45, 28, 25, 42),
(225, 225, 45, 39, 34, 18, 24, 15, 42),
(226, 226, 43, 32, 45, 36, 16, 10, 40),
(227, 227, 37, 2, 43, 39, 25, 39, 10),
(228, 228, 45, 20, 2, 35, 5, 13, 33),
(229, 229, 35, 12, 32, 38, 12, 41, 34),
(230, 230, 7, 5, 19, 16, 31, 3, 19),
(231, 231, 25, 19, 10, 25, 8, 43, 18),
(232, 232, 10, 28, 9, 35, 2, 27, 45),
(233, 233, 23, 36, 36, 10, 23, 48, 22),
(234, 234, 18, 46, 40, 32, 1, 18, 18),
(235, 235, 34, 29, 50, 8, 23, 36, 12),
(236, 236, 29, 30, 12, 47, 33, 31, 6),
(237, 237, 13, 23, 41, 29, 23, 31, 1),
(238, 238, 31, 23, 43, 26, 32, 11, 36),
(239, 239, 35, 23, 36, 29, 15, 31, 21),
(240, 240, 4, 11, 31, 27, 31, 45, 42),
(241, 241, 50, 22, 8, 24, 18, 35, 7),
(242, 242, 2, 35, 4, 36, 40, 47, 13),
(243, 243, 24, 4, 20, 14, 26, 36, 10),
(244, 244, 20, 48, 27, 23, 16, 44, 50),
(245, 245, 14, 9, 47, 22, 29, 18, 1),
(246, 246, 19, 16, 28, 8, 32, 6, 13),
(247, 247, 47, 2, 46, 11, 48, 28, 30),
(248, 248, 26, 40, 18, 6, 13, 14, 18),
(249, 249, 9, 20, 16, 47, 24, 37, 5),
(250, 250, 3, 10, 19, 11, 26, 17, 45),
(251, 251, 21, 38, 49, 33, 36, 2, 2),
(252, 252, 33, 23, 5, 35, 37, 35, 20),
(253, 253, 17, 38, 50, 23, 42, 5, 38),
(254, 254, 32, 28, 42, 26, 20, 10, 47),
(255, 255, 15, 13, 18, 7, 18, 12, 48),
(256, 256, 48, 49, 14, 23, 15, 50, 18),
(257, 257, 19, 16, 17, 48, 40, 35, 27),
(258, 258, 12, 13, 20, 6, 40, 23, 31),
(259, 259, 14, 27, 45, 23, 28, 33, 38),
(260, 260, 3, 2, 6, 37, 35, 10, 42),
(261, 261, 8, 30, 37, 46, 5, 19, 22),
(262, 262, 9, 38, 40, 14, 8, 30, 12),
(263, 263, 4, 33, 22, 31, 35, 30, 28),
(264, 264, 24, 32, 14, 28, 11, 14, 18),
(265, 265, 40, 28, 5, 3, 45, 6, 36),
(266, 266, 25, 38, 47, 30, 46, 43, 22),
(267, 267, 44, 39, 35, 10, 16, 32, 6),
(268, 268, 1, 15, 3, 17, 45, 38, 45),
(269, 269, 47, 46, 29, 50, 45, 17, 17),
(270, 270, 40, 8, 44, 4, 30, 41, 47),
(271, 271, 6, 16, 13, 18, 5, 46, 6),
(272, 272, 50, 48, 5, 36, 4, 48, 26),
(273, 273, 23, 21, 39, 18, 32, 1, 24),
(274, 274, 45, 21, 50, 23, 4, 47, 43),
(275, 275, 12, 7, 40, 20, 14, 11, 15),
(276, 276, 36, 32, 29, 12, 7, 44, 6),
(277, 277, 8, 1, 9, 30, 10, 28, 26),
(278, 278, 42, 46, 16, 35, 27, 6, 38),
(279, 279, 30, 15, 35, 24, 42, 33, 21),
(280, 280, 44, 25, 20, 22, 8, 48, 26),
(281, 281, 49, 15, 5, 45, 4, 8, 21),
(282, 282, 17, 43, 39, 7, 48, 10, 8),
(283, 283, 8, 16, 37, 6, 14, 35, 48),
(284, 284, 21, 2, 4, 24, 31, 2, 14),
(285, 285, 34, 24, 25, 35, 14, 14, 10),
(286, 286, 29, 14, 50, 30, 32, 46, 25),
(287, 287, 46, 15, 36, 11, 3, 12, 46),
(288, 288, 4, 3, 5, 20, 15, 15, 40),
(289, 289, 40, 10, 28, 36, 16, 48, 37),
(290, 290, 36, 2, 44, 18, 19, 32, 44),
(291, 291, 18, 19, 46, 43, 27, 38, 44),
(292, 292, 22, 2, 19, 43, 11, 3, 21),
(293, 293, 43, 21, 33, 10, 11, 17, 40),
(294, 294, 19, 43, 47, 33, 13, 15, 7),
(295, 295, 22, 41, 38, 11, 38, 41, 18),
(296, 296, 15, 39, 11, 35, 38, 46, 22),
(297, 297, 27, 48, 14, 31, 24, 19, 1),
(298, 298, 19, 13, 31, 22, 23, 41, 3),
(299, 299, 1, 18, 5, 5, 41, 32, 26),
(300, 300, 9, 34, 31, 11, 19, 46, 2),
(301, 301, 50, 22, 27, 23, 22, 13, 12),
(302, 302, 28, 16, 4, 34, 47, 34, 45),
(303, 303, 20, 14, 26, 38, 40, 44, 21),
(304, 304, 7, 14, 32, 4, 38, 17, 2),
(305, 305, 14, 45, 24, 43, 50, 35, 26),
(306, 306, 47, 47, 26, 23, 36, 15, 16),
(307, 307, 40, 38, 35, 35, 26, 21, 26),
(308, 308, 36, 4, 13, 14, 44, 11, 46),
(309, 309, 4, 36, 30, 44, 15, 2, 2),
(310, 310, 3, 16, 10, 36, 47, 11, 20),
(311, 311, 4, 18, 2, 47, 14, 4, 8),
(312, 312, 15, 37, 47, 22, 30, 14, 9),
(313, 313, 42, 11, 4, 37, 35, 40, 15),
(314, 314, 9, 30, 5, 49, 44, 36, 27),
(315, 315, 16, 8, 39, 30, 1, 10, 8),
(316, 316, 7, 42, 7, 26, 2, 21, 32),
(317, 317, 35, 16, 15, 8, 19, 41, 41),
(318, 318, 19, 19, 50, 39, 47, 23, 6),
(319, 319, 25, 3, 9, 43, 39, 20, 43),
(320, 320, 2, 35, 13, 47, 5, 47, 23),
(321, 321, 1, 12, 15, 28, 24, 18, 31),
(322, 322, 13, 6, 28, 2, 9, 25, 4),
(323, 323, 34, 20, 48, 36, 9, 13, 41),
(324, 324, 42, 30, 50, 19, 29, 23, 30),
(325, 325, 25, 37, 35, 11, 37, 33, 36),
(326, 326, 41, 24, 37, 13, 20, 37, 15),
(327, 327, 45, 40, 26, 16, 20, 15, 46),
(328, 328, 17, 44, 44, 13, 8, 29, 47),
(329, 329, 38, 48, 49, 11, 30, 20, 33),
(330, 330, 1, 30, 20, 15, 1, 6, 13),
(331, 331, 19, 48, 45, 17, 45, 31, 27),
(332, 332, 34, 28, 10, 34, 15, 50, 32),
(333, 333, 43, 33, 49, 18, 42, 21, 14),
(334, 334, 11, 35, 31, 4, 20, 22, 42),
(335, 335, 12, 27, 1, 43, 28, 11, 6),
(336, 336, 34, 46, 21, 41, 5, 9, 1),
(337, 337, 10, 29, 11, 39, 16, 47, 44),
(338, 338, 8, 50, 27, 40, 20, 1, 3),
(339, 339, 16, 42, 28, 3, 30, 39, 7),
(340, 340, 30, 2, 19, 15, 15, 18, 27),
(341, 341, 44, 11, 2, 10, 48, 1, 13),
(342, 342, 4, 42, 3, 2, 31, 43, 23),
(343, 343, 49, 47, 36, 15, 16, 45, 1),
(344, 344, 47, 8, 29, 50, 19, 45, 13),
(345, 345, 1, 30, 27, 2, 33, 33, 7),
(346, 346, 32, 31, 47, 16, 35, 45, 11),
(347, 347, 40, 12, 32, 4, 6, 38, 39),
(348, 348, 10, 12, 19, 48, 22, 49, 20),
(349, 349, 7, 23, 8, 48, 8, 28, 41),
(350, 350, 41, 44, 27, 9, 28, 48, 13),
(351, 351, 11, 28, 17, 33, 40, 27, 6),
(352, 352, 2, 11, 41, 28, 3, 12, 16),
(353, 353, 30, 11, 27, 21, 17, 19, 18),
(354, 354, 20, 38, 38, 35, 13, 45, 47),
(355, 355, 46, 45, 7, 2, 14, 30, 9),
(356, 356, 7, 37, 35, 23, 50, 35, 47),
(357, 357, 20, 48, 49, 25, 3, 12, 43),
(358, 358, 23, 13, 18, 39, 18, 30, 44),
(359, 359, 40, 29, 48, 33, 34, 39, 25),
(360, 360, 14, 18, 44, 21, 11, 48, 8),
(361, 361, 49, 8, 33, 6, 32, 37, 35),
(362, 362, 24, 46, 13, 14, 11, 10, 27),
(363, 363, 15, 44, 44, 17, 46, 5, 44),
(364, 364, 16, 39, 40, 43, 50, 11, 48),
(365, 365, 15, 48, 4, 39, 29, 46, 15),
(366, 366, 36, 9, 19, 2, 4, 20, 24),
(367, 367, 11, 15, 9, 7, 21, 14, 48),
(368, 368, 15, 14, 2, 29, 19, 30, 24),
(369, 369, 9, 34, 15, 11, 14, 9, 4),
(370, 370, 14, 11, 16, 19, 2, 50, 3),
(371, 371, 17, 19, 2, 39, 39, 19, 15),
(372, 372, 22, 37, 46, 34, 28, 16, 9),
(373, 373, 17, 29, 1, 37, 36, 33, 42),
(374, 374, 43, 3, 24, 50, 44, 15, 18),
(375, 375, 24, 20, 7, 14, 40, 29, 33),
(376, 376, 36, 29, 43, 48, 10, 38, 20),
(377, 377, 36, 1, 26, 20, 2, 46, 24),
(378, 378, 37, 30, 11, 32, 33, 24, 19),
(379, 379, 18, 2, 24, 32, 27, 6, 48),
(380, 380, 20, 15, 5, 22, 35, 40, 22),
(381, 381, 43, 16, 14, 19, 13, 4, 16),
(382, 382, 49, 31, 9, 2, 35, 20, 20),
(383, 383, 36, 11, 8, 50, 48, 12, 24),
(384, 384, 36, 25, 32, 20, 7, 45, 29),
(385, 385, 38, 16, 30, 42, 13, 29, 2),
(386, 386, 2, 41, 37, 29, 18, 35, 36),
(387, 387, 48, 46, 2, 39, 2, 6, 6),
(388, 388, 20, 17, 11, 13, 19, 16, 7),
(389, 389, 36, 40, 44, 37, 8, 28, 49),
(390, 390, 31, 20, 47, 4, 30, 15, 43),
(391, 391, 1, 17, 13, 30, 13, 11, 10),
(392, 392, 10, 47, 40, 34, 18, 36, 39),
(393, 393, 4, 38, 6, 8, 5, 6, 31),
(394, 394, 17, 17, 39, 34, 4, 35, 47),
(395, 395, 8, 41, 45, 27, 18, 13, 32),
(396, 396, 40, 8, 26, 44, 20, 30, 47),
(397, 397, 6, 30, 15, 6, 21, 42, 41),
(398, 398, 4, 33, 4, 38, 11, 45, 33),
(399, 399, 22, 36, 30, 25, 42, 24, 5),
(400, 400, 35, 10, 38, 14, 9, 39, 48),
(401, 401, 21, 32, 1, 21, 30, 37, 12),
(402, 402, 28, 9, 4, 40, 48, 28, 42),
(403, 403, 14, 13, 45, 9, 14, 26, 44),
(404, 404, 40, 10, 5, 5, 16, 31, 6),
(405, 405, 34, 30, 12, 9, 46, 15, 35),
(406, 406, 44, 36, 42, 21, 25, 5, 23),
(407, 407, 36, 18, 21, 39, 49, 41, 7),
(408, 408, 3, 39, 42, 23, 46, 24, 16),
(409, 409, 31, 43, 46, 29, 13, 22, 1),
(410, 410, 44, 36, 29, 22, 29, 15, 33),
(411, 411, 46, 35, 7, 10, 17, 15, 42),
(412, 412, 25, 26, 26, 5, 23, 10, 43),
(413, 413, 3, 26, 42, 13, 33, 1, 16),
(414, 414, 5, 31, 4, 22, 19, 46, 1),
(415, 415, 17, 12, 46, 28, 34, 16, 7),
(416, 416, 23, 33, 48, 18, 13, 6, 45),
(417, 417, 20, 48, 15, 35, 21, 17, 33),
(418, 418, 10, 18, 41, 30, 20, 37, 17),
(419, 419, 42, 44, 32, 9, 22, 26, 2),
(420, 420, 7, 18, 46, 7, 15, 26, 6),
(421, 421, 31, 22, 5, 35, 16, 5, 6),
(422, 422, 50, 32, 41, 40, 33, 27, 15),
(423, 423, 39, 43, 20, 1, 41, 27, 50),
(424, 424, 1, 39, 16, 9, 41, 2, 43),
(425, 425, 36, 15, 49, 16, 26, 38, 48),
(426, 426, 8, 10, 35, 34, 3, 22, 25),
(427, 427, 30, 17, 31, 10, 7, 39, 15),
(428, 428, 39, 8, 21, 34, 36, 21, 6),
(429, 429, 5, 11, 28, 10, 7, 19, 33),
(430, 430, 6, 29, 18, 50, 37, 32, 8),
(431, 431, 48, 27, 26, 40, 48, 5, 29),
(432, 432, 17, 48, 30, 13, 33, 43, 6),
(433, 433, 1, 44, 21, 31, 22, 9, 4),
(434, 434, 29, 50, 3, 49, 22, 35, 22),
(435, 435, 38, 23, 10, 30, 26, 36, 30),
(436, 436, 48, 14, 1, 19, 39, 6, 24),
(437, 437, 26, 15, 12, 41, 39, 31, 34),
(438, 438, 6, 7, 34, 42, 10, 43, 1),
(439, 439, 3, 10, 16, 10, 35, 21, 32),
(440, 440, 46, 25, 8, 46, 36, 22, 44),
(441, 441, 30, 30, 42, 35, 30, 32, 21),
(442, 442, 9, 32, 47, 18, 12, 50, 19),
(443, 443, 18, 14, 6, 36, 20, 30, 29),
(444, 444, 42, 22, 50, 40, 47, 34, 42),
(445, 445, 30, 46, 1, 10, 26, 5, 3),
(446, 446, 45, 2, 47, 21, 14, 28, 43),
(447, 447, 16, 1, 35, 10, 35, 8, 26),
(448, 448, 12, 50, 24, 38, 20, 13, 42),
(449, 449, 8, 9, 22, 36, 32, 11, 15),
(450, 450, 30, 33, 2, 14, 31, 50, 45),
(451, 451, 26, 11, 35, 8, 5, 40, 1),
(452, 452, 3, 27, 6, 29, 39, 42, 17),
(453, 453, 28, 17, 23, 15, 10, 36, 25),
(454, 454, 45, 38, 32, 24, 30, 13, 38),
(455, 455, 35, 1, 22, 30, 47, 24, 2),
(456, 456, 50, 31, 43, 22, 9, 14, 21),
(457, 457, 16, 49, 24, 26, 25, 18, 26),
(458, 458, 8, 28, 20, 38, 50, 26, 29),
(459, 459, 46, 2, 45, 34, 33, 41, 42),
(460, 460, 43, 20, 41, 7, 29, 1, 11),
(461, 461, 33, 39, 3, 27, 2, 12, 3),
(462, 462, 2, 26, 30, 36, 6, 35, 39),
(463, 463, 12, 41, 13, 34, 10, 15, 45),
(464, 464, 19, 1, 15, 12, 4, 5, 4),
(465, 465, 14, 26, 23, 29, 5, 2, 47),
(466, 466, 35, 41, 26, 35, 5, 23, 10),
(467, 467, 18, 30, 17, 31, 28, 7, 44),
(468, 468, 35, 8, 23, 25, 5, 20, 48),
(469, 469, 44, 20, 45, 18, 15, 45, 41),
(470, 470, 40, 29, 8, 36, 5, 19, 10),
(471, 471, 40, 19, 45, 49, 37, 16, 45),
(472, 472, 11, 41, NULL, 14, 40, 4, 35),
(473, 473, 15, 39, 1, 22, 42, 21, 5),
(474, 474, 2, 44, 9, 31, 33, 6, 4),
(475, 475, 26, 1, 10, 50, 48, 46, 1),
(476, 476, 46, 31, 26, 16, 48, 19, 44),
(477, 477, 20, 31, 43, 44, 32, 11, 43),
(478, 478, 49, 30, 13, 17, 5, 16, 29),
(479, 479, 22, 46, 36, 26, 45, 8, 2),
(480, 480, 42, 41, 13, 7, 50, 17, 19),
(481, 481, 24, 17, 33, 44, 48, 29, 15),
(482, 482, 24, 4, 18, 14, 42, 14, 11),
(483, 483, 14, 11, 32, 47, 34, 37, 29),
(484, 484, 40, 26, 15, 39, 50, 4, 31),
(485, 485, 26, 29, 27, 15, 29, 42, 11),
(486, 486, 33, 41, 33, 24, 16, 40, 14),
(487, 487, 36, 17, 47, 28, 19, 48, 32),
(488, 488, 2, 34, 33, 36, 7, 47, 43),
(489, 489, 22, 45, 40, 36, 24, 24, 29),
(490, 490, 10, 5, 24, 23, 16, 21, 21),
(491, 491, 4, 36, 50, 27, 44, 21, 14),
(492, 492, 35, 42, 49, 1, 5, 36, 25),
(493, 493, 28, 33, 4, 43, 38, 1, 17),
(494, 494, 39, 10, 13, 14, 19, 34, 44),
(495, 495, 34, 26, 3, 14, 14, 23, 45),
(496, 496, 40, 19, 10, 45, 17, 1, 43),
(497, 497, 39, 20, 26, 43, 49, 29, 5),
(498, 498, 21, 21, 24, 30, 43, 35, 4),
(499, 499, 17, 15, 33, 13, 29, 17, 11),
(500, 500, 31, 31, 41, 13, 42, 50, 9),
(506, 506, 182135, 741590, 654967, 51117, 530027, 377010, 927865),
(507, 507, 176941, 940281, 575719, 836139, 652173, 162749, 363068),
(508, 508, 454, 257, 258, 175, 374, 209, 118);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nameSurname` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `deleteAbleStatus` tinyint(1) UNSIGNED NOT NULL,
  `registerDate` int(10) NOT NULL,
  `registeripAddress` varchar(20) NOT NULL,
  `activationCode` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `mail`, `password`, `nameSurname`, `phone`, `gender`, `status`, `deleteAbleStatus`, `registerDate`, `registeripAddress`, `activationCode`) VALUES
(1, 'blegojcan@gmail.com', '670f8574bd93dd78bd568dab84c6733a', 'Can Şık', '54654564654', NULL, 1, 0, 0, '', ''),
(3, 'fatmind17@gmail.com', '670f8574bd93dd78bd568dab84c6733a', 'Jimenez', '5417884800', '1', 1, 0, 1600436412, '::1', '62424-64045-74357-99456'),
(4, 'skcan17@gmail.com', '670f8574bd93dd78bd568dab84c6733a', 'Jarvis', '90541788480', '1', 1, 0, 1600436631, '::1', '69337-66611-30368-15008'),
(5, 'f.authorityetc@gmail.com', '670f8574bd93dd78bd568dab84c6733a', 'Marsh', '5554443322', '2', 1, 0, 1600437056, '::1', '71253-67728-98584-11771'),
(7, 'blegojcan@outlook.com', '670f8574bd93dd78bd568dab84c6733a', 'selin melin', '55555555555', '2', 1, 0, 1604782506, '::1', '77938-98638-59478-36629');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cargofirms`
--
ALTER TABLE `cargofirms`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `intro`
--
ALTER TABLE `intro`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sizetableamount`
--
ALTER TABLE `sizetableamount`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EmailAdresi` (`mail`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `cargofirms`
--
ALTER TABLE `cargofirms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `intro`
--
ALTER TABLE `intro`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=509;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Tablo için AUTO_INCREMENT değeri `sizetableamount`
--
ALTER TABLE `sizetableamount`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=509;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
