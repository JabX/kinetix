﻿CREATE TYPE WF_WORKFLOW_UPDATE_TABLE_TYPE as TABLE
(
	WFW_ID INT,
	WFA_ID_2 INT,
	INSERT_KEY INT
)
GO

GRANT EXECUTE ON TYPE::[dbo].[WF_WORKFLOW_UPDATE_TABLE_TYPE] TO PUBLIC;
go