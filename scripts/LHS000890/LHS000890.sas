

PROC FORMAT;
	value child_sex_fmt
	1 = 'Male' 
	0 = 'Female';
	value alive_fmt
	0 = 'Dead'
	1 = 'Alive';
	value ethnicity_fmt
	1 = 'Garifuna'
	2 = 'Lenca'
	3 = 'Maya Chorti'
	4 = 'Misquito'
	5 = 'Other'
	6 = 'None/Dont know';
	value urban_fmt
	0 = "Urban"
	1 = "Rural";
	value region_fmt
	1 = 'ATLANTIDA'                      
    2 = 'COLON'
	3 = 'COMAYAGUA' 
    4 = 'COPAN'                   
	5 = 'CORTES'            
	6 = 'CHOLUTECA' 
	7 = 'EL PARAISO'
	8 = 'FRANCISCO MORAZAN'
	9 = 'GRACIAS A DIOS'
    10 = 'INTIBUCA'
    11 = 'ISLAS DE LA BAHIA'
	12 = 'LA PAZ' 
    13 = 'LEMPIRA'
	14 = 'OCOTEPEQUE'
    15 = 'OLANCHO'                            
	16 = 'SANTA BARBARA'
	17 = 'VALLE'
	18 = 'YORO'
	19 = 'SAN PEDRO SULA'
	20 = 'DISTRITO CENTRAL';
	value magebrt_fmt
	1 = '<20'
	2 = '20-34'
	3 = '35+';
RUN;
