
SELECT Country_Id, Country_Iso_Code , Country_Name FROM sh.countries WHERE Country_region IN ('Asia', 'Oceania');
CREATE VIEW CountryCodeView AS SELECT Country_Name , (Country_Iso_Code ||'+'|| (CAST(Country_Id AS varchar2(5)))) AS "ISO+ID" FROM sh.countries WHERE Country_region IN ('Asia', 'Oceania') ORDER BY Country_Name;
SELECT * from CountryCodeView;
