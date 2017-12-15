CREATE TABLE [dbo].[Department] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Employeers] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Surname]      NVARCHAR (50) NULL,
    [Name]         NVARCHAR (15) NULL,
    [Patronymic]   NVARCHAR (15) NULL,
    [DepartmentId] INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id])
);

insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Волошин', N'Максимилиан', N'Александрович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Тургенев', N'Иван', N'Сергеевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Ломоносов', N'Михаил', N'Васильевич', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Тютчев', N'Фёдор', N'Иванович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Дружинин', N'Александр', N'Васильевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Зощенко', N'Михаил', N'Михайлович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Сумароков', N'Александр', N'Петрович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Вяземский', N'Пётр', N'Андреевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Иванов', N'Георгий', N'Владимирович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Мережковский', N'Дмитрий', N'Сергеевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Салтыков-Щедрин', N'Михаил', N'Евграфович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Мариенгоф', N'Анатолий', N'Борисович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Пушкин', N'Александр', N'Сергеевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Сологуб', N'Фёдор', N'Кузьмич', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Тынянов', N'Юрий', N'Николаевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Аверченко', N'Аркадий', N'Тимофеевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Короленко', N'Владимир', N'Галактионович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Шмелев', N'Иван', N'Сергеевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Есенин', N'Сергей', N'Александрович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Мамин-Сибиряк', N'Дмитрий', N'Наркисович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Добролюбов', N'Николай', N'Александрович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Заболоцкий', N'Николай', N'Алексеевич', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Грибоедов', N'Александр', N'Сергеевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Бунин', N'Иван', N'Алексеевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Чехов', N'Антон', N'Павлович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Кольцов', N'Алексей', N'Васильевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Фонвизин', N'Денис', N'Иванович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Маяковский', N'Владимир', N'Владимирович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Гончаров', N'Иван', N'Александрович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Тарковский', N'Арсений', N'Александрович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Ахматова', N'Анна', N'Андреевна', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Пришвин', N'Михаил', N'Михайлович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Булгаков', N'Михаил', N'Афанасьевич', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Писемский', N'Алексей', N'Феофилактович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Гаршин', N'Всеволод', N'Михайлович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Толстой', N'Алексей', N'Николаевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Бальмонт', N'Константин', N'Дмитриевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Кузмин', N'Михаил', N'Алексеевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Андреев', N'Леонид', N'Николаевич', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Введенский', N'Александр', N'Иванович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Иванов', N'Вячеслав', N'Иванович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Батюшков', N'Константин', N'Николаевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Загоскин', N'Михаил', N'Николаевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Жуковский', N'Василий', N'Андреевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Зайцев', N'Борис', N'Константинович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Бабель', N'Исаак', N'Эммануилович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Некрасов', N'Николай', N'Николаевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Клюев', N'Николай', N'Алексеевич', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Ходасевич', N'Владислав', N'Фелицианович', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Пастернак', N'Борис', N'Леонидович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Одоевский', N'Владимир', N'Фёдорович', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Ремизов', N'Алексей', N'Михайлович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Брюсов', N'Валерий', N'Яковлевич', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Глинка', N'Фёдор', N'Николаевич', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Куприн', N'Александр', N'Иванович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Толстой', N'Лев', N'Николаевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Фет', N'Афанасий', N'Афанасьевич', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Лермонтов', N'Михаил', N'Юрьевич', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Достоевский', N'Фёдор', N'Михайлович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Григорович', N'Дмитрий', N'Васильевич', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Мандельштам', N'Осип', N'Эмильевич', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Толстой', N'Алексей', N'Константинович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Набоков', N'Владимир', N'Владимирович', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Гарин-Михайловский', N'Николай', N'Георгиевич', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Карамзин', N'Николай', N'Михайлович', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Бестужев', N'Александр', N'Александрович', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Замятин', N'Евгений', N'Иванович', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Цветаева', N'Марина', N'Ивановна', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Анненский', N'Иннокентий', N'Фёдорович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Гоголь', N'Николай', N'Васильевич', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Лесков', N'Николай', N'Семёнович', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Радищев', N'Александр', N'Николаевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Апухтин', N'Алексей', N'Николаевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Аксаков', N'Сергей', N'Тимофеевич', NULL);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Астафьев', N'Виктор', N'Петрович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Ершов', N'Пётр', N'Павлович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Солженицын', N'Александр', N'Исаевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Помяловский', N'Николай', N'Герасимович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Герцен', N'Александр', N'Иванович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Успенский', N'Глеб', N'Иванович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Шолохов', N'Михаил', N'Александрович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Блок', N'Александр', N'Александрович', 1);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Державин', N'Гавриил', N'Романович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Чуковский', N'Корней', N'Иванович', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Гумилев', N'Николай', N'Степанович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Гнедич', N'Николай', N'Иванович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Баратынский', N'Евгений', N'Абрамович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Островский', N'Александр', N'Николаевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Крылов', N'Иван', N'Андреевич', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Гиппиус', N'Зинаида', N'Николаевна', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Чернышевский', N'Николай', N'Гаврилович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Катаев', N'Валентин', N'Петрович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Данилевский', N'Григорий', N'Петрович', 3);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Давыдов', N'Денис', N'Васильевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Майков', N'Аполлон', N'Николаевич', 2);
insert into Employeers (Surname, Name, Patronymic, DepartmentId) values  (N'Паустовский', N'Константин', N'Георгиевич', 1);