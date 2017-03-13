/*
Missing Index Details from:

SELECT
    LTRIM(RTRIM((RTRIM((CAST(T1."EffectiveEmployerId" AS char(11)))) + ' - ' + T4."ClientCompanyNm"))),
    T1."EffectiveEmployerId",
    MAX(LTRIM(RTRIM((RTRIM((CAST(T1."EffectiveEmployerId" AS char(11)))) + ' - ' + T4."ClientCompanyNm"))))
FROM
    dbo.FactPDMoneyMove T1,
    dbo.DimClient T4
WHERE
    (T4."ClientKey" = T1."EffectiveClientKey") AND
    (T1."RowDeleteInd" = 0) AND
    (T4."RowDeleteInd" = 0)
GROUP BY
    LTRIM(RTRIM((RTRIM((CAST(T1."EffectiveEmployerId" AS char(11)))) + ' - ' + T4."ClientCompanyNm"))),
    T1."EffectiveEmployerId"
ORDER BY
    LTRIM(RTRIM((RTRIM((CAST(T1."EffectiveEmployerId" AS  char(11)))) + ' - ' + T4."ClientCompanyNm"))),
    T1."EffectiveEmployerId";

The Query Processor estimates that implementing the following index could improve the query cost by 70.033%.
*/

/*
USE [VBSAnalytics]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [dbo].[FactPDMoneyMove] ([RowDeleteInd])
INCLUDE ([EffectiveEmployerId],[EffectiveClientKey])
GO
*/
