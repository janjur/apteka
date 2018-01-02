INSERT INTO `Mikroblog`.`Roles` (`idRoles`, `RoleName`) VALUES ('1', 'admin');
INSERT INTO `Mikroblog`.`Roles` (`idRoles`, `RoleName`) VALUES ('2', 'common');
INSERT INTO `Mikroblog`.`Roles` (`idRoles`, `RoleName`) VALUES ('3', 'banned');
INSERT INTO `Mikroblog`.`Roles` (`idRoles`, `RoleName`) VALUES ('4', 'deleted');

INSERT INTO `Mikroblog`.`Users` (`IdUsers`, `Login`, `Password`, `CreationDate`, `UserRole`, `NumPosts`, `NumComments`) VALUES ('1', 'john', 'janek', '2016-12-04 14:24:04', '1', '5', '2');
INSERT INTO `Mikroblog`.`Users` (`IdUsers`, `Login`, `Password`, `CreationDate`, `UserRole`, `NumPosts`, `NumComments`) VALUES ('2', 'peter', 'piotrek', '2016-12-04 14:24:04', '2', '1', '1');
INSERT INTO `Mikroblog`.`Users` (`IdUsers`, `Login`, `Password`, `CreationDate`, `UserRole`, `NumPosts`, `NumComments`) VALUES ('3', 'vojislav', 'wojtek', '2016-12-04 14:24:04', '2', '3', '1');
INSERT INTO `Mikroblog`.`Users` (`IdUsers`, `Login`, `Password`, `CreationDate`, `UserRole`, `NumPosts`, `NumComments`) VALUES ('4', 'oskarek89', 'barca', '2016-12-04 14:24:04', '3', '2', '0');
INSERT INTO `Mikroblog`.`Users` (`IdUsers`, `Login`, `Password`, `CreationDate`, `UserRole`, `NumPosts`, `NumComments`) VALUES ('5', 'gpdm2j', 'haslo123', '2016-12-04 14:24:04', '4', '1', '0');
INSERT INTO `Mikroblog`.`Users` (`IdUsers`, `Login`, `Password`, `CreationDate`, `UserRole`, `NumPosts`, `NumComments`) VALUES ('6', 'login', 'password', '2016-12-13 12:28:23', '1', '0', '0');
INSERT INTO `Mikroblog`.`Users` (`IdUsers`, `Login`, `Password`, `CreationDate`, `UserRole`, `NumPosts`, `NumComments`) VALUES ('7', 'Doktor', 'Wojcik', '2016-12-13 12:31:23', '1', '0', '1');
INSERT INTO `Mikroblog`.`Users` (`IdUsers`, `Login`, `Password`, `CreationDate`, `UserRole`, `NumPosts`, `NumComments`) VALUES ('8', 'jCob', 'jjj', '2016-12-14 11:54:16', '1', '0', '1');

INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('9', 'Are we alone in The Universe', '2016-12-11 11:34:51', '1', '0');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('10', 'Should we use question mark in questions?', '2016-12-11 11:45:00', '2', '0');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('11', 'You canot prove I am wrong!', '2016-12-11 12:12:00', '5', '0');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('12', 'xD', '2016-12-11 15:00:00', '4', '0');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('13', 'i bet 8k$ on barca tonight. DOn\'t dissapoint me!', '2016-12-11 18:10:00', '4', '0');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('14', 'TIL: You can put a pan under scrambled eggs! It\'s easier to keep burners cleen this way!', '2016-12-11 21:38:00', '3', '0');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('15', 'is this the new reddit everyone is talking about?', '2016-12-11 22:10:00', '1', '2');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('16', 'you know, it\'s my first manually added post from GUI.', '2016-12-11 12:48:47', '3', '2');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('17', 'hi. I add this as logged in user :D', '2016-12-12 22:52:41', '1', '0');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('18', 'WOW. I HAVE LOGGED IN', '2016-12-12 23:00:40', '3', '1');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('19', 'im sitting with jCob!', '2016-12-14 11:54:04', '1', '1');
INSERT INTO `Mikroblog`.`Posts` (`idPosts`, `Content`, `CreationDate`, `Author`, `NumComments`) VALUES ('20', 'asdkaspda', '2016-12-18 15:15:52', '1', '0');

INSERT INTO `Mikroblog`.`Comments` (`idComments`, `Content`, `CreationDate`, `Author`, `ParentPost`) VALUES ('17', 'i don\'t think so. It looks dumb.', '2016-12-11 12:41:46', '2', '15');
INSERT INTO `Mikroblog`.`Comments` (`idComments`, `Content`, `CreationDate`, `Author`, `ParentPost`) VALUES ('18', 'and it\'s first comment added to manually added post :) Welcome on board!', '2016-12-11 12:49:18', '1', '16');
INSERT INTO `Mikroblog`.`Comments` (`idComments`, `Content`, `CreationDate`, `Author`, `ParentPost`) VALUES ('19', 'Did i?', '2016-12-12 23:02:33', '3', '18');
INSERT INTO `Mikroblog`.`Comments` (`idComments`, `Content`, `CreationDate`, `Author`, `ParentPost`) VALUES ('20', 'Hi boyz, summary report plz', '2016-12-13 12:44:23', '7', '15');
INSERT INTO `Mikroblog`.`Comments` (`idComments`, `Content`, `CreationDate`, `Author`, `ParentPost`) VALUES ('21', 'tats right!', '2016-12-14 11:54:29', '8', '19');
INSERT INTO `Mikroblog`.`Comments` (`idComments`, `Content`, `CreationDate`, `Author`, `ParentPost`) VALUES ('22', 'elo', '2016-12-18 15:38:51', '1', '16');
