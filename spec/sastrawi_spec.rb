require 'spec_helper'

describe Sastrawi do
  it 'has a version number' do
    expect(Sastrawi::VERSION).not_to be nil
  end

  it 'should not stem short words' do
    short_words = %w[mei bui]
    base_form = %w[mei bui]
    stemming_result = []

    short_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should not stem "nilai" to "nila"' do
    expect(Sastrawi.stem('nilai')).to eq('nilai')
  end

  it 'should stem "-lah, -kah, -tah, -pun" suffixes' do
    suffixed_words = %w[hancurlah benarkah apatah siapapun]
    base_form = %w[hancur benar apa siapa]
    stemming_result = []

    suffixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem "-ku, -mu, -nya" suffixes' do
    suffixed_words = %w[jubahku bajumu celananya]
    base_form = %w[jubah baju celana]
    stemming_result = []

    suffixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem "-i, -kan, -an" suffixes' do
    suffixed_words = %w[hantui belikan jualan]
    base_form = %w[hantu beli jual]
    stemming_result = []

    suffixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem combination of suffixes' do
    suffixed_words = %w[bukumukah miliknyalah kulitkupun berikanku sakitimu beriannya kasihilah]
    base_form = %w[buku milik kulit beri sakit beri kasih]
    stemming_result = []

    suffixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem plain prefix' do
    plain_prefixed_words = %w[dibuang kesakitan sesuap]
    base_form = %w[buang sakit suap]
    stemming_result = []

    plain_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem first rule of derivation prefixes' do
    first_rule_prefixed_words = %w[beradu berambut]
    base_form = %w[adu rambut]
    stemming_result = []

    first_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem second rule of derivation prefixes' do
    expect(Sastrawi.stem('bersuara')).to eq('suara')
  end

  it 'should stem third rule of derivation prefixes' do
    expect(Sastrawi.stem('berdaerah')).to eq('daerah')
  end

  it 'should stem fourth rule of derivation prefixes' do
    expect(Sastrawi.stem('belajar')).to eq('ajar')
  end

  it 'should stem fifth rule of derivation prefixes' do
    fifth_rule_prefixed_words = %w[bekerja beternak]
    base_form = %w[kerja ternak]
    stemming_result = []

    fifth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem sixth rule of derivation prefixes' do
    sixth_rule_prefixed_words = %w[terasing teraup]
    base_form = %w[asing raup]
    stemming_result = []

    sixth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq (true)
  end

  it 'should stem seventh rule of derivation prefixes' do
    expect(Sastrawi.stem('tergerak')).to eq('gerak')
  end

  it 'should stem eighth rule of derivation prefixes' do
    expect(Sastrawi.stem('terpuruk')).to eq('puruk')
  end

  it 'should stem ninth rule of derivation prefixes' do
    expect(Sastrawi.stem('teterbang')).to eq('terbang')
  end

  it 'should stem tenth rule of derivation prefixes' do
    tenth_rule_prefixed_words = %w[melipat meringkas mewarnai meyakinkan]
    base_form = %w[lipat ringkas warna yakin]
    stemming_result = []

    tenth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq (true)
  end

  it 'should stem eleventh rule of derivation prefixes' do
    eleventh_rule_prefixed_words = %w[membangun memfitnah memvonis]
    base_form = %w[bangun fitnah vonis]
    stemming_result = []

    eleventh_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem twelfth rule of derivation prefixes' do
    twelfth_rule_prefixed_words = %w[memperbarui mempelajari]
    base_form = %w[baru ajar]
    stemming_result = []

    twelfth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem thirteenth rule of derivation prefixes' do
    thirteenth_rule_prefixed_words = %w[meminum memukul]
    base_form = %w[minum pukul]
    stemming_result = []

    thirteenth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq (true)
  end

  it 'should stem fourteenth rule of derivation prefixes' do
    fourteenth_rule_prefixed_words = %w[mencinta mendua menjauh menziarah]
    base_form = %w[cinta dua jauh ziarah]
    stemming_result = []

    fourteenth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem fifteenth rule of derivation prefixes' do
    fifteenth_rule_prefixed_words = %w[menuklir menangkap]
    base_form = %w[nuklir tangkap]
    stemming_result = []

    fifteenth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem sixteenth rule of derivation prefixes' do
    sixteenth_rule_prefixed_words = %w[menggila menghajar mengqasar]
    base_form = %w[gila hajar qasar]
    stemming_result = []

    sixteenth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem seventeenth rule of derivation prefixes' do
    seventeenth_rule_prefixed_words = %w[mengudara mengupas]
    base_form = %w[udara kupas]
    stemming_result =[]

    seventeenth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem eighteenth rule of derivation prefixes' do
    expect(Sastrawi.stem('menyuarakan')).to eq('suara')
  end

  it 'should stem nineteeth rule of derivation prefixes' do
    expect(Sastrawi.stem('mempopulerkan')).to eq('populer')
  end

  it 'should stem twentieth rule of derivation prefixes' do
    twentieth_rule_prefixed_words = %w[pewarna peyoga]
    base_form = %w[warna yoga]
    stemming_result = []

    twentieth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem twenty-first rule of derivation prefixes' do
    twenty_first_rule_prefixed_words = %w[peradilan perumahan]
    base_form = %w[adil rumah]
    stemming_result = []

    twenty_first_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem twenty-third rule of derivation prefixes' do
    expect(Sastrawi.stem('permuka')).to eq('muka')
  end

  it 'should stem twenty-fourth rule of derivation prefixes' do
    expect(Sastrawi.stem('perdaerah')).to eq('daerah')
  end

  it 'should stem twenty-fifth rule of derivation prefixes' do
    twenty_fifth_rule_prefixed_words = %w[pembangun pemfitnah pemvonis]
    base_form = %w[bangun fitnah vonis]
    stemming_result = []

    twenty_fifth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem twenty-sixth rule of derivation prefixes' do
    twenty_sixth_rule_prefixed_words = %w[peminum pemukul]
    base_form = %w[minum pukul]
    stemming_result = []

    twenty_sixth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem twenty-eighth rule of derivation prefixes' do
    twenty_eighth_rule_prefixed_words = %w[penasihat penangkap]
    base_form = %w[nasihat tangkap]
    stemming_result = []

    twenty_eighth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem twenty-ninth rule of derivation prefixes' do
    twenty_ninth_rule_prefixed_words = %w[penggila penghajar pengqasar]
    base_form = %w[gila hajar qasar]
    stemming_result = []

    twenty_ninth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem thirtieth rule of derivation prefixes' do
    thirtieth_rule_prefixed_words = %w[pengudara pengupas]
    base_form = %w[udara kupas]
    stemming_result = []

    thirtieth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem thirtieth-first rule of derivation prefixes' do
    expect(Sastrawi.stem('penyuara')).to eq('suara')
  end

  it 'should stem thirtieth-second rule of derivation prefixes' do
    thirtieth_second_rule_prefixed_words = %w[pelajar pelabuhan]
    base_form = %w[ajar labuh]
    stemming_result = []

    thirtieth_second_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem thirtieth-fourth rule of derivation prefixes' do
    expect(Sastrawi.stem('petarung')).to eq('tarung')
  end

  it 'should stem thirtieth-fifth rule of derivation prefixes' do
    expect(Sastrawi.stem('terpercaya')).to eq('percaya')
  end

  it 'should stem thirtieth-sixth rule of derivation prefixes' do
    thirtieth_sixth_rule_prefixed_words = %w[pekerja peserta]
    base_form = %w[kerja serta]
    stemming_result = []

    thirtieth_sixth_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem modified twelfth and sixteenth rules' do
    modified_rule_prefixed_words = %w[mempengaruhi mengkritik]
    base_form = %w[pengaruh kritik]
    stemming_result = []

    modified_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end
end
