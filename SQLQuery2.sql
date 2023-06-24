USE [datatablep]
GO

/****** Object:  Table [dbo].[takes]    Script Date: 4/17/2023 11:15:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[takes](
	[ID] [int] NOT NULL,
	[course_id] [char](30) NOT NULL,
	[sec_id] [int] NOT NULL,
	[semester] [char](20) NOT NULL,
	[year] [int] NOT NULL,
	[grade] [char](10) NULL,
 CONSTRAINT [pk_takes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[course_id] ASC,
	[sec_id] ASC,
	[semester] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[takes]  WITH CHECK ADD  CONSTRAINT [fk_sec] FOREIGN KEY([course_id], [sec_id], [semester], [year])
REFERENCES [dbo].[section] ([course_id], [sec_id], [semester], [year])
GO

ALTER TABLE [dbo].[takes] CHECK CONSTRAINT [fk_sec]
GO

ALTER TABLE [dbo].[takes]  WITH CHECK ADD  CONSTRAINT [fk_stu] FOREIGN KEY([ID])
REFERENCES [dbo].[student] ([ID])
on delete cascade 
on update cascade 
GO

ALTER TABLE [dbo].[takes] DROP CONSTRAINT [fk_stu]
GO


