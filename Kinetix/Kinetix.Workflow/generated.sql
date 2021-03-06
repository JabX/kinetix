﻿GO
PRINT N'Création de [dbo].[WF_ACTIVITY]...';


GO
CREATE TABLE [dbo].[WF_ACTIVITY] (
    [WFA_ID]        INT           IDENTITY (1, 1) NOT NULL,
    [CREATION_DATE] DATETIME2 (7) NULL,
    [WFW_ID]        INT           NULL,
    [WFAD_ID]       INT           NULL,
    CONSTRAINT [PK_WF_ACTIVITY] PRIMARY KEY CLUSTERED ([WFA_ID] ASC)
);


GO
PRINT N'Création de [dbo].[WF_ACTIVITY].[IDX_WF_ACTIVITY_WFW_ID_FK]...';


GO
CREATE NONCLUSTERED INDEX [IDX_WF_ACTIVITY_WFW_ID_FK]
    ON [dbo].[WF_ACTIVITY]([WFW_ID] ASC);


GO
PRINT N'Création de [dbo].[WF_ACTIVITY_DEFINITION]...';


GO
CREATE TABLE [dbo].[WF_ACTIVITY_DEFINITION] (
    [WFAD_ID]   INT            IDENTITY (1, 1) NOT NULL,
    [NAME]      NVARCHAR (100) NULL,
    [LEVEL]     INT            NULL,
    [WFMD_CODE] NVARCHAR (3)   NULL,
    [WFWD_ID]   INT            NOT NULL,
    CONSTRAINT [PK_WF_ACTIVITY_DEFINITION] PRIMARY KEY CLUSTERED ([WFAD_ID] ASC)
);


GO
PRINT N'Création de [dbo].[WF_DECISION]...';


GO
CREATE TABLE [dbo].[WF_DECISION] (
    [WFE_ID]        INT             IDENTITY (1, 1) NOT NULL,
    [USER]          NVARCHAR (100)  NULL,
    [CHOICE]        INT             NULL,
    [DECISION_DATE] DATETIME2 (7)   NULL,
    [COMMENTS]      NVARCHAR (3000) NULL,
    [WFA_ID]        INT             NOT NULL,
    CONSTRAINT [PK_WF_DECISION] PRIMARY KEY CLUSTERED ([WFE_ID] ASC)
);


GO
PRINT N'Création de [dbo].[WF_MULTIPLICITY_DEFINITION]...';


GO
CREATE TABLE [dbo].[WF_MULTIPLICITY_DEFINITION] (
    [WFMD_CODE] NVARCHAR (3)   NOT NULL,
    [LABEL]     NVARCHAR (100) NULL,
    CONSTRAINT [PK_WF_MULTIPLICITY_DEFINITION] PRIMARY KEY CLUSTERED ([WFMD_CODE] ASC)
);


GO
PRINT N'Création de [dbo].[WF_STATUS]...';


GO
CREATE TABLE [dbo].[WF_STATUS] (
    [WFS_CODE] NVARCHAR (3)   NOT NULL,
    [LABEL]    NVARCHAR (100) NULL,
    CONSTRAINT [PK_WF_STATUS] PRIMARY KEY CLUSTERED ([WFS_CODE] ASC)
);


GO
PRINT N'Création de [dbo].[WF_TRANSITION_DEFINITION]...';


GO
CREATE TABLE [dbo].[WF_TRANSITION_DEFINITION] (
    [WFTD_ID]      INT            IDENTITY (1, 1) NOT NULL,
    [NAME]         NVARCHAR (100) NULL,
    [WFWD_ID]      INT            NULL,
    [WFAD_ID_FROM] INT            NOT NULL,
    [WFAD_ID_TO]   INT            NOT NULL,
    CONSTRAINT [PK_WF_TRANSITION_DEFINITION] PRIMARY KEY CLUSTERED ([WFTD_ID] ASC)
);


GO
PRINT N'Création de [dbo].[WF_TRANSITION_DEFINITION].[IDX_WF_TRANSITION_DEFINITION_WFAD_ID_FROM_FK]...';


GO
CREATE NONCLUSTERED INDEX [IDX_WF_TRANSITION_DEFINITION_WFAD_ID_FROM_FK]
    ON [dbo].[WF_TRANSITION_DEFINITION]([WFAD_ID_FROM] ASC);


GO
PRINT N'Création de [dbo].[WF_TRANSITION_DEFINITION].[IDX_WF_TRANSITION_DEFINITION_WFAD_ID_TO_FK]...';


GO
CREATE NONCLUSTERED INDEX [IDX_WF_TRANSITION_DEFINITION_WFAD_ID_TO_FK]
    ON [dbo].[WF_TRANSITION_DEFINITION]([WFAD_ID_TO] ASC);


GO
PRINT N'Création de [dbo].[WF_TRANSITION_DEFINITION].[IDX_WF_TRANSITION_DEFINITION_WFWD_ID_FK]...';


GO
CREATE NONCLUSTERED INDEX [IDX_WF_TRANSITION_DEFINITION_WFWD_ID_FK]
    ON [dbo].[WF_TRANSITION_DEFINITION]([WFWD_ID] ASC);


GO
PRINT N'Création de [dbo].[WF_WORKFLOW]...';


GO
CREATE TABLE [dbo].[WF_WORKFLOW] (
    [WFW_ID]        INT           IDENTITY (1, 1) NOT NULL,
    [CREATION_DATE] DATETIME2 (7) NULL,
    [ITEM_ID]       INT           NULL,
    [USER]          NVARCHAR (50) NULL,
    [USER_LOGIC]    BIT           NOT NULL,
    [WFWD_ID]       INT           NOT NULL,
    [WFS_CODE]      NVARCHAR (3)  NOT NULL,
    [WFA_ID_2]      INT           NULL,
    CONSTRAINT [PK_WORKFLOW] PRIMARY KEY CLUSTERED ([WFW_ID] ASC)
);


GO
PRINT N'Création de [dbo].[WF_WORKFLOW].[IDX_WF_WORKFLOW_WFWD_ID_FK]...';


GO
CREATE NONCLUSTERED INDEX [IDX_WF_WORKFLOW_WFWD_ID_FK]
    ON [dbo].[WF_WORKFLOW]([WFWD_ID] ASC);


GO
PRINT N'Création de [dbo].[WF_WORKFLOW].[IDX_WF_WORKFLOW_WFS_CODE_FK]...';


GO
CREATE NONCLUSTERED INDEX [IDX_WF_WORKFLOW_WFS_CODE_FK]
    ON [dbo].[WF_WORKFLOW]([WFS_CODE] ASC);


GO
PRINT N'Création de [dbo].[WF_WORKFLOW].[IDX_WF_WORKFLOW_WFA_ID_2_FK]...';


GO
CREATE NONCLUSTERED INDEX [IDX_WF_WORKFLOW_WFA_ID_2_FK]
    ON [dbo].[WF_WORKFLOW]([WFA_ID_2] ASC);


GO
PRINT N'Création de [dbo].[WF_WORKFLOW_DEFINITION]...';


GO
CREATE TABLE [dbo].[WF_WORKFLOW_DEFINITION] (
    [WFWD_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [NAME]          NVARCHAR (100) NULL,
    [DATE_CREATION] DATETIME2 (7)  NULL,
    [WFAD_ID]       INT            NULL,
    CONSTRAINT [PK_WF_WORKFLOW_DEFINITION] PRIMARY KEY CLUSTERED ([WFWD_ID] ASC)
);


GO
PRINT N'Création de [dbo].[WF_WORKFLOW_DEFINITION].[IDX_WF_WORKFLOW_DEFINITION_WFAD_ID_FK]...';


GO
CREATE NONCLUSTERED INDEX [IDX_WF_WORKFLOW_DEFINITION_WFAD_ID_FK]
    ON [dbo].[WF_WORKFLOW_DEFINITION]([WFAD_ID] ASC);



GO
PRINT N'Création de [dbo].[FK_WFAD_WFA]...';


GO
ALTER TABLE [dbo].[WF_ACTIVITY] WITH NOCHECK
    ADD CONSTRAINT [FK_WFAD_WFA] FOREIGN KEY ([WFAD_ID]) REFERENCES [dbo].[WF_ACTIVITY_DEFINITION] ([WFAD_ID]);


GO
PRINT N'Création de [dbo].[FK_WFMD_CODE]...';


GO
ALTER TABLE [dbo].[WF_ACTIVITY_DEFINITION] WITH NOCHECK
    ADD CONSTRAINT [FK_WFMD_CODE] FOREIGN KEY ([WFMD_CODE]) REFERENCES [dbo].[WF_MULTIPLICITY_DEFINITION] ([WFMD_CODE]);


GO
PRINT N'Création de [dbo].[FK_WFE_WFA]...';


GO
ALTER TABLE [dbo].[WF_DECISION] WITH NOCHECK
    ADD CONSTRAINT [FK_WFE_WFA] FOREIGN KEY ([WFA_ID]) REFERENCES [dbo].[WF_ACTIVITY] ([WFA_ID]);


GO
PRINT N'Création de [dbo].[FK_WFT_WFA_FROM]...';


GO
ALTER TABLE [dbo].[WF_TRANSITION_DEFINITION] WITH NOCHECK
    ADD CONSTRAINT [FK_WFT_WFA_FROM] FOREIGN KEY ([WFAD_ID_FROM]) REFERENCES [dbo].[WF_ACTIVITY_DEFINITION] ([WFAD_ID]);


GO
PRINT N'Création de [dbo].[FK_WFT_WFA_TO]...';


GO
ALTER TABLE [dbo].[WF_TRANSITION_DEFINITION] WITH NOCHECK
    ADD CONSTRAINT [FK_WFT_WFA_TO] FOREIGN KEY ([WFAD_ID_TO]) REFERENCES [dbo].[WF_ACTIVITY_DEFINITION] ([WFAD_ID]);


GO
PRINT N'Création de [dbo].[FK_WFWD_WFTD]...';


GO
ALTER TABLE [dbo].[WF_TRANSITION_DEFINITION] WITH NOCHECK
    ADD CONSTRAINT [FK_WFWD_WFTD] FOREIGN KEY ([WFWD_ID]) REFERENCES [dbo].[WF_WORKFLOW_DEFINITION] ([WFWD_ID]);


GO
PRINT N'Création de [dbo].[FK_WFWD_ID]...';


GO
ALTER TABLE [dbo].[WF_WORKFLOW] WITH NOCHECK
    ADD CONSTRAINT [FK_WFWD_ID] FOREIGN KEY ([WFWD_ID]) REFERENCES [dbo].[WF_WORKFLOW_DEFINITION] ([WFWD_ID]);


GO
PRINT N'Création de [dbo].[FK_WFS_CODE]...';


GO
ALTER TABLE [dbo].[WF_WORKFLOW] WITH NOCHECK
    ADD CONSTRAINT [FK_WFS_CODE] FOREIGN KEY ([WFS_CODE]) REFERENCES [dbo].[WF_STATUS] ([WFS_CODE]);


GO
PRINT N'Création de [dbo].[FK_WFWD_WFAD]...';


GO
ALTER TABLE [dbo].[WF_WORKFLOW_DEFINITION] WITH NOCHECK
    ADD CONSTRAINT [FK_WFWD_WFAD] FOREIGN KEY ([WFAD_ID]) REFERENCES [dbo].[WF_ACTIVITY_DEFINITION] ([WFAD_ID]);



GO
PRINT N'Création de [dbo].[WF_ACTIVITY].[Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Workflow', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WF_ACTIVITY';


GO
PRINT N'Création de [dbo].[WF_ACTIVITY_DEFINITION].[Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ActivityDefinition', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WF_ACTIVITY_DEFINITION';


GO
PRINT N'Création de [dbo].[WF_DECISION].[Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Decision', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WF_DECISION';


GO
PRINT N'Création de [dbo].[WF_MULTIPLICITY_DEFINITION].[Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'MultiplicityDefinition', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WF_MULTIPLICITY_DEFINITION';


GO
PRINT N'Création de [dbo].[WF_STATUS].[Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WF_STATUS';


GO
PRINT N'Création de [dbo].[WF_TRANSITION_DEFINITION].[Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'TransitionDefinition', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WF_TRANSITION_DEFINITION';


GO
PRINT N'Création de [dbo].[WF_WORKFLOW].[Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Workflow', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WF_WORKFLOW';


GO
PRINT N'Création de [dbo].[WF_WORKFLOW_DEFINITION].[Description]...';


ALTER TABLE [dbo].[WF_ACTIVITY] WITH CHECK CHECK CONSTRAINT [FK_WFAD_WFA];

ALTER TABLE [dbo].[WF_ACTIVITY_DEFINITION] WITH CHECK CHECK CONSTRAINT [FK_WFMD_CODE];

ALTER TABLE [dbo].[WF_DECISION] WITH CHECK CHECK CONSTRAINT [FK_WFE_WFA];

ALTER TABLE [dbo].[WF_TRANSITION_DEFINITION] WITH CHECK CHECK CONSTRAINT [FK_WFT_WFA_FROM];

ALTER TABLE [dbo].[WF_TRANSITION_DEFINITION] WITH CHECK CHECK CONSTRAINT [FK_WFT_WFA_TO];

ALTER TABLE [dbo].[WF_TRANSITION_DEFINITION] WITH CHECK CHECK CONSTRAINT [FK_WFWD_WFTD];

ALTER TABLE [dbo].[WF_WORKFLOW] WITH CHECK CHECK CONSTRAINT [FK_WFWD_ID];

ALTER TABLE [dbo].[WF_WORKFLOW] WITH CHECK CHECK CONSTRAINT [FK_WFS_CODE];

ALTER TABLE [dbo].[WF_WORKFLOW_DEFINITION] WITH CHECK CHECK CONSTRAINT [FK_WFWD_WFAD];