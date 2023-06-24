USE [datatablep]
GO

/****** Object:  Table [dbo].[advisor]    Script Date: 4/17/2023 11:10:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[advisor](
	[s_id] [int] NOT NULL,
	[i_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[advisor]  WITH CHECK ADD  CONSTRAINT [fk_i_id] FOREIGN KEY([i_id])
REFERENCES [dbo].[instructor] ([ID])
GO

ALTER TABLE [dbo].[advisor] CHECK CONSTRAINT [fk_i_id]
GO

ALTER TABLE [dbo].[advisor]  WITH CHECK ADD  CONSTRAINT [fk_s_id] FOREIGN KEY([s_id])
REFERENCES [dbo].[student] ([ID])
on delete cascade
on update cascade
GO

ALTER TABLE [dbo].[advisor] DROP CONSTRAINT [fk_s_id]
GO
