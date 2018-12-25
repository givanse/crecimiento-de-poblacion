const getPopStats = require('../lib/get-pop-stats');
const {expect} = require('chai');

describe('get-pop-stats', function() {

  it('CBSA defaults to 99999', function() {
    const result = getPopStats(null, {}, {});
    expect(result.cbsa).to.be.equal('99999');
    expect(result.msaName).to.be.equal('N/A');
    expect(result.p2014).to.be.equal('N/A');
    expect(result.p2015).to.be.equal('N/A');
  });

  it('overwrites CBSA if it matches the MDIV', function() {
    const cbsa = '1000';
    const dataIndexedByMDIV = {
      '1000': {CBSA: '2000'},
    };
    const dataIndexedByCBSA = {
      '2000': {NAME: 'Springfield', POPESTIMATE2014: '2014', POPESTIMATE2015: '2015'},
    };

    const result = getPopStats(cbsa, dataIndexedByMDIV, dataIndexedByCBSA);
    expect(result.cbsa).to.be.equal('2000');
    expect(result.msaName).to.be.equal('Springfield');
    expect(result.p2014).to.be.equal('2014');
    expect(result.p2015).to.be.equal('2015');
  });

});
