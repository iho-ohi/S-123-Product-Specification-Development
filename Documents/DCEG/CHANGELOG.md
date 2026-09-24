# S-123 DCEG Edition 2.0.0 source update

Basis: `S-123_DCEG_Ed.2.0.0_20260323.docx` supplied by the user.

## Applied

- Replaced the substantive content of section files 01 through 13 with the March 2026 Edition 2.0.0 DCEG content converted to AsciiDoc.
- Preserved the existing section filenames expected by the project.
- Added deterministic `sec_X...` anchors based on the Edition 2.0.0 clause hierarchy so existing Metanorma-style cross-references have stable targets.
- Updated the S-123 bibliography edition from 1.1.0 to 2.0.0.
- This brings in the Edition 2.0.0 model changes, including Search and Rescue Region, Telemedical Assistance Service, Available Telemedical Assistance Service, The Fuzzy Component, Data Transmission Rate, Optimum Display Scale, Subject or Message Type Code, and Coast Station Identification Code, and removes entries absent from the 2.0.0 reference.

## Deliberately not propagated

- The reference DOCX copyright year `2024` was not introduced into these section files.
- The reference DOCX's broken `Table Error: Reference source not found.1` caption is not treated as authoritative markup.
- `00-preface.adoc` was retained because the Document History table in the supplied 2.0.0 DOCX contains no populated history rows; inventing a history would not be source-grounded.
- Template/layout-only differences are not targets of this update.

## Review note

The Word-to-AsciiDoc conversion is content-oriented. Complex tables should be compiled with the IHO Metanorma project and visually reviewed, especially table spans and cross-references.
