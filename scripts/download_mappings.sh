#!/bin/bash

# Downloads groups, categories, year, etc. mappings from the respective API
# endpoints.

# var apiEndpoints = {
#   parties: { url: 'parties', autoLoad: true },
#   yearGroups: { url: 'years/groups', autoLoad: true },
#   categories: { url: 'dimension-instances/category', autoLoad: true },
#   gases: { url: 'dimension-instances/gas', autoLoad: true },
#   units: { url: 'conversion', autoLoad: true },
#   records: { url: 'records/detail-by-category', autoLoad: false }
# };

cd `dirname $0`/api-mappings

# @FlorianDRX - extended with extra GET sequences at https://di.unfccc.int/indicators_annex1 (obtain with 'inspect element' -> method = GET -> 'headers' in Firefox)
wget http://di.unfccc.int/api/parties -q -O- | \
  python3 -m json.tool > parties.json
wget http://di.unfccc.int/api/years/groups -q -O- | \
  python3 -m json.tool > years.json
wget http://di.unfccc.int/api/dimension-instances/category -q -O- | \
  python3 -m json.tool > categories.json
wget http://di.unfccc.int/api/dimension-instances/classification -q -O- | \
  python3 -m json.tool > classifications.json  # @FlorianDRX - 2nd GET sequence
wget https://di.unfccc.int/api/dimension-instances/measure -q -O- | \
  python3 -m json.tool > measures.json # @FlorianDRX - 3rd GET sequence
wget http://di.unfccc.int/api/dimension-instances/gas -q -O- | \
  python3 -m json.tool > gases.json
wget http://di.unfccc.int/api/conversion -q -O- | \
  python3 -m json.tool > conversion.json # @FlorianDRX - has 3 objects (annexOne [1152], nonAnnexOne [956] and units [16])
wget http://di.unfccc.int/api/conversion/fq/ -q -O- | \
  python3 -m json.tool > conversion2.json # @FlorianDRX - has 3 objects (annexOne [2738], nonAnnexOne [2891] and units [179])

# @FlorianDRX: other API GET sequences used to check existence of variable combination pairs (?)
## AnnexOne:
wget https://di.unfccc.int/api/variables/fq/annexOne -q -O- | \
  python3 -m json.tool > variables_AnnexOne.json
## NonAnnexOne:
wget https://di.unfccc.int/api/variables/fq/nonAnnexOne -q -O- | \
  python3 -m json.tool > variables_nonAnnexOne.json

pwd
ls -l
