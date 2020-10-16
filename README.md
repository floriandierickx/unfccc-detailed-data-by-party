## Purpose of this fork = add classifications subdivision for emission inventories

Background/intro: https://twitter.com/FlorianDRX/status/1317098006123040768?s=20

Final goal: csv file with subdivision Party -> Parent Category -> Category -> **Classification** -> Gas

Steps:

1. add classifications to the mapping download script (`download_mappings.sh`) -> converts api to json [https://github.com/floriandierickx/unfccc-detailed-data-by-party/commit/f04271833e7a7f87e8017640519fa2eedbd4b4d9]
    - when running `make mappings` : json file gets saved in `/scripts/api-mappings/classifications.json` [https://github.com/floriandierickx/unfccc-detailed-data-by-party/commit/d1b61afdd6482a00aacb77c387b303e08daf5cf7]
2. add classifications file to `mappings.py`, so it can be used in the download script `download.py` [https://github.com/floriandierickx/unfccc-detailed-data-by-party/commit/6ddc951d3ba961891c825da632abb6d3469d5c32]
3. adapt `download.py` script to download all data [https://github.com/floriandierickx/unfccc-detailed-data-by-party/commit/050d72c707dd1c7e98c4839e5c478a73bdc92cf7]
4. ,,, (waiting..)

# Original readme
From https://github.com/openclimatedata/unfccc-detailed-data-by-party and https://github.com/JGuetschow/unfccc-detailed-data-by-party:

Data Package with UNFCCC emissions data, downloaded from the UNFCCC ["Detailed Data By Party"](http://di.unfccc.int/detailed_data_by_party) interface.

[![DOI](https://zenodo.org/badge/251323371.svg)](https://zenodo.org/badge/latestdoi/251323371)

Maintainers:

- Johannes Gütschow (<johannes.guetschow@pik-potsdam.de>)
- Robert Gieseke (<robert.gieseke@pik-potsdam.de>) (currently inactive)

## Data

The data is available in two files, one for Annex-I and one for Non-Annex-I parties.
Is is in a "wide" format, with base year and individual years as columns.

According to the [overview webpage](https://unfccc.int/process-and-meetings/transparency-and-reporting/greenhouse-gas-data/ghg-data-unfccc/ghg-data-from-unfccc) the interface contains data reported until 8 November 2019.

>  The secretariat has completed the upgrade of all nine modules of the GHG data interface on 8 November 2019.

Note also the following footnotes from the data interface:

> Note 1: The reporting and review requirements for GHG inventories are different for Annex I and non-Annex I Parties. The definition format of data for emissions/removals from the forestry sector is different for Annex I and non-Annex I Parties.

> Note 2: Base year data in the data interface relate to the base year under the Climate Change Convention (UNFCCC). The base year under the Convention is defined slightly different than the base year under the Kyoto Protocol. An exception is made for European Union (KP) whereby the base year under the Kyoto Protocol is displayed.

> Note 3: Some non-Annex I Parties submitted their GHG inventory data using the format of the 2006 IPCC Guidelines in reporting GHG emissions/removals. For this reason, these data could not be included in the data interface. However, the data are available in the national communications (Andorra, Antigua and Barbuda, Armenia, Bangladesh, Brunei Darussalam, Cabo Verde, Costa Rica, Côte d'Ivoire, Colombia, Equatorial Guinea, Eswatini, Grenada, Ghana, Indonesia, Iran, Jamaica, Kuwait, Malaysia, Mauritania, Mauritius, Mexico, Mongolia, Namibia, Nicaragua, Panama, Oman, Republic of Moldova, Rwanda, Samoa, Serbia, Sierra Leone, Singapore, Somalia, South Africa, Suriname, United Arab Emirates, Venezuela, and Viet Nam) and biennial update reports (Afghanistan, Andorra, Argentina, Armenia, Azerbaijan, Benin, Chile, Colombia, Costa Rica, Côte d'Ivoire, Egypt, El Salvador, Ghana, Georgia, India, Indonesia, Jordan, Malaysia, Mauritania, Mexico, Mongolia, Montenegro, Morocco, Namibia, Nigeria, North Macedonia, Oman, Panama, Paraguay, Papua New Guinea, Peru, Republic of Moldova, Serbia, Singapore, South Africa, Tajikistan, Togo, Tunisia, Uruguay, and Uganda).

> Note 5: Data displayed on the data interface are "as received" from Parties. The publication of Party submissions on this website does not imply the expression of any opinion whatsoever on the part of the UNFCCC or the Secretariat of the United Nations concerning the legal status of any country, territory, city or area or of its authorities, or concerning the delimitation of its frontiers or boundaries as may be referred to in any of the submissions.



## Processing

To update the dataset once updates become available, the following steps need to be run. It might be necessary to adjust the scripts if the data format or website changes. Python3 and Make are required. The process should run on Linux or macOS.

Run

```shell
make mappings
```

to download category and group mappings,

```shell
make download
```

to download the data as JSON files and

```shell
make process
```

to generate CSV files for Annex-I and Non-Annex-I.

To remove all downloaded and generated files run

```shell
make clean
```

This needs to be done to check for updated data. To continue an interrupted
download or check for new data simply re-run `make download`.
Files already downloaded are skipped.


## License

The [UNFCCC website](http://unfccc.int/home/items/2783.php) states:

> All official texts, data and documents are in the public domain and may be freely downloaded, copied and printed provided no change to the content is introduced, and the source is acknowledged.
