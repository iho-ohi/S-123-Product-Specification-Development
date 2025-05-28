The sample data for S-123 (August 2017) consists of three files in two containers (folders) - an exchange set container and a single dataset container), structured as follows:

<this folder>			Where this README and the base folder of the dataset are located
  README.TXT			This file
  MRS_ROOT/			The base folder for the sample exchange set
    CATALOG.123.XML		The exchange set catalogue and metadata as specified in S-100 Part 4a
    JSNPIS123EX_A0001/		Folder containing a dataset that is part of the exchange set
        JSNPIS123EX_A0001.GML	Sample dataset in GML format
        MD_JSNPIS123EX_A0001.XML	ISO 19115 metadata for the dataset

Depending on where you unpack the dataset and S-123 schemas, the schema location in the dataset and catalogues may need to be updated for the relevant schemas to be reachable. The arrangement used during development of the sample data was as follows:

<base>				Base folder
    data/				Folder for exchange sets
        MRS_ROOT/			Folder for sample exchange set. The structure of its contents is explained above.
    schemas/			Folder for schemas (XSD files)
        S123/			Folder for S-123 schemas (XSDs)
            1.0/			Folder for S-123 V 1.0 XSDs
                20170831/		Folder for 201700831 build of S-123 XSDs
                    S123.xsd		The GML application schema for S-123 V 1.0.0 April 30 2017 draft
	    S123Basic.sch		Schematron files implementing skeleton Schematron checks
        S100_3_0_0/			Folder for S-100 GML profile and catalog schema XSDs
            S100Catalog/		Folder for XSDs for the exchange set catalogue
                20170831/		Current (August 2017) build of exchange set catalogue XSDs
            S100GML/			Folder for XSDs for the S-100 GML profile
                20170505/		Folder for current (August 2017) build of XSDs for the S-100 GML profile for S-100 version 3.0.0 (allows
					points to be referenced as well as inline coordinates)
            w3c/			Folder for W3C Xlinks XSD (used by other XSDs)

Referenced to older builds or other locations should have been updated to the current build and location, but if there are any residual references to older builds or other locations try updating them and inform me (Raphael Malyankar) about them.

