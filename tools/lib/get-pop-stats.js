
function getPopStats(cbsa, dataIndexedByMDIV, dataIndexedByCBSA) {
  cbsa = cbsa ? cbsa : '99999';

  const resultRow = {
    cbsa: cbsa,
    msaName: 'N/A',
    p2014: 'N/A',
    p2015: 'N/A',
  };

  if (resultRow.cbsa === '99999') {
    return resultRow;
  }

  // Overwrite CBSA if MSA was found
  let file2Row = dataIndexedByMDIV[cbsa];
  if (file2Row) {
    resultRow.cbsa = file2Row.CBSA;
  }

  file2Row = dataIndexedByCBSA[resultRow.cbsa];
  if (file2Row) {
    resultRow.p2014 = file2Row.POPESTIMATE2014;
    resultRow.p2015 = file2Row.POPESTIMATE2015;
    resultRow.msaName = file2Row.NAME;
  }

  return resultRow;
}

module.exports = getPopStats;
