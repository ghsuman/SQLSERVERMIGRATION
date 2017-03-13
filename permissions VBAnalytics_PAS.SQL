ALTER ROLE [db_owner] ADD MEMBER [TMKMHC\TMKVBSArchitect]
ALTER ROLE [db_ddladmin] ADD MEMBER [ds_vbs]
ALTER ROLE [db_datareader] ADD MEMBER [ds_vbs]
ALTER ROLE [db_datawriter] ADD MEMBER [ds_vbs]
ALTER ROLE [db_datareader] ADD MEMBER [TMKMHC\TMKVBSAllSysAnalystDeveloper]
ALTER ROLE [db_datawriter] ADD MEMBER [TMKMHC\TMKVBSAllSysAnalystDeveloper]



GRANT ALTER ON dbo.DimClaimAdjustor TO ds_vbs
GRANT DELETE ON dbo.DimClaimAdjustor TO ds_vbs
GRANT INSERT ON dbo.DimClaimAdjustor TO ds_vbs
GRANT REFERENCES ON dbo.DimClaimAdjustor TO ds_vbs
GRANT SELECT ON dbo.DimClaimAdjustor TO ds_vbs
GRANT UPDATE ON dbo.DimClaimAdjustor TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimClaimAdjustor TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimClaimAdjustor TO ds_vbs
GRANT ALTER ON dbo.DimClaim TO ds_vbs
GRANT DELETE ON dbo.DimClaim TO ds_vbs
GRANT INSERT ON dbo.DimClaim TO ds_vbs
GRANT REFERENCES ON dbo.DimClaim TO ds_vbs
GRANT SELECT ON dbo.DimClaim TO ds_vbs
GRANT UPDATE ON dbo.DimClaim TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimClaim TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimClaim TO ds_vbs
GRANT ALTER ON dbo.DimPlan TO ds_vbs
GRANT DELETE ON dbo.DimPlan TO ds_vbs
GRANT INSERT ON dbo.DimPlan TO ds_vbs
GRANT REFERENCES ON dbo.DimPlan TO ds_vbs
GRANT SELECT ON dbo.DimPlan TO ds_vbs
GRANT UPDATE ON dbo.DimPlan TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimPlan TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimPlan TO ds_vbs
GRANT ALTER ON dbo.DimCompany TO ds_vbs
GRANT DELETE ON dbo.DimCompany TO ds_vbs
GRANT INSERT ON dbo.DimCompany TO ds_vbs
GRANT REFERENCES ON dbo.DimCompany TO ds_vbs
GRANT SELECT ON dbo.DimCompany TO ds_vbs
GRANT UPDATE ON dbo.DimCompany TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimCompany TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimCompany TO ds_vbs
GRANT ALTER ON dbo.DimInsured TO ds_vbs
GRANT DELETE ON dbo.DimInsured TO ds_vbs
GRANT INSERT ON dbo.DimInsured TO ds_vbs
GRANT REFERENCES ON dbo.DimInsured TO ds_vbs
GRANT SELECT ON dbo.DimInsured TO ds_vbs
GRANT UPDATE ON dbo.DimInsured TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimInsured TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimInsured TO ds_vbs
GRANT ALTER ON dbo.DimClaimEligibilityStatus TO ds_vbs
GRANT DELETE ON dbo.DimClaimEligibilityStatus TO ds_vbs
GRANT INSERT ON dbo.DimClaimEligibilityStatus TO ds_vbs
GRANT REFERENCES ON dbo.DimClaimEligibilityStatus TO ds_vbs
GRANT SELECT ON dbo.DimClaimEligibilityStatus TO ds_vbs
GRANT UPDATE ON dbo.DimClaimEligibilityStatus TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimClaimEligibilityStatus TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimClaimEligibilityStatus TO ds_vbs
GRANT ALTER ON dbo.DimClaimStatus TO ds_vbs
GRANT DELETE ON dbo.DimClaimStatus TO ds_vbs
GRANT INSERT ON dbo.DimClaimStatus TO ds_vbs
GRANT REFERENCES ON dbo.DimClaimStatus TO ds_vbs
GRANT SELECT ON dbo.DimClaimStatus TO ds_vbs
GRANT UPDATE ON dbo.DimClaimStatus TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimClaimStatus TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimClaimStatus TO ds_vbs
GRANT ALTER ON dbo.DimClaimType TO ds_vbs
GRANT DELETE ON dbo.DimClaimType TO ds_vbs
GRANT INSERT ON dbo.DimClaimType TO ds_vbs
GRANT REFERENCES ON dbo.DimClaimType TO ds_vbs
GRANT SELECT ON dbo.DimClaimType TO ds_vbs
GRANT UPDATE ON dbo.DimClaimType TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimClaimType TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimClaimType TO ds_vbs
GRANT ALTER ON dbo.DimEnrollmentCompany TO ds_vbs
GRANT DELETE ON dbo.DimEnrollmentCompany TO ds_vbs
GRANT INSERT ON dbo.DimEnrollmentCompany TO ds_vbs
GRANT REFERENCES ON dbo.DimEnrollmentCompany TO ds_vbs
GRANT SELECT ON dbo.DimEnrollmentCompany TO ds_vbs
GRANT TAKE OWNERSHIP ON dbo.DimEnrollmentCompany TO ds_vbs
GRANT UPDATE ON dbo.DimEnrollmentCompany TO ds_vbs
GRANT VIEW DEFINITION ON dbo.DimEnrollmentCompany TO ds_vbs
GRANT VIEW CHANGE TRACKING ON dbo.DimEnrollmentCompany TO ds_vbs

