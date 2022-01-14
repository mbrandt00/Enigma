require_relative './spec_helper'
require './lib/enigma'
require 'RSpec'
require 'pry'
require 'Ostruct'
RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end
  describe '#encrypt' do
    it 'will return an encrypted message' do
      expect(@enigma.encrypt('hello world!', '02715', '040895')[:encryption]).to eq('keder ohulw!')
    end
    it 'will return the key' do
      expect(@enigma.encrypt('hello world!', '02715', '040895')[:key]).to eq('02715')
    end
    it 'will return the date' do
      expect(@enigma.encrypt('hello world!', '02715', '040895')[:date]).to eq('040895')
    end
    it 'does not require a key' do
      expect(@enigma.encrypt('hello world!', date = '040895')[:key]).to be_kind_of(String)
    end
    it 'will default to today if no date is provided' do
      expect(@enigma.encrypt('hello world!', '02715')[:date]).to eq(Date.today.strftime('%m%d%y'))
    end
    it 'only requires a message for encryption' do
      expect(@enigma.encrypt('hello_world')[:encryption]).to be_kind_of(String)
    end
    it 'will return a hash with three keys: encryption, key, date' do
      expect(@enigma.encrypt('hello world!', '02715', date = '040895').keys).to eq(%i[encryption key date])
    end
  end
  describe '#decrypt' do
    it 'will return an encrypted message' do
      expect(@enigma.decrypt('txwipwowfxpzgo', '25031', '010922')[:decryption]).to eq('valar dohaeris')
    end
    it 'will return a hash with three keys: decryption, key, date' do
      expect(@enigma.decrypt('txwipwowfxpzgo', '25031', '010922').keys).to eq(%i[decryption key date])
    end
  end

  it 'will generate a key that is five digits' do
    expect(@enigma.generate_key.length).to eq(5)
  end

  it 'will return todays date in mmddyy form' do
    expect(@enigma.todays_date[0..1]).to eq('01') # true for January
    expect(@enigma.todays_date[4..5]).to eq('22') # true for 2022
  end

  it 'will return a hash' do
    expect(@enigma.hash_preparer('text', '01345', '021100', 'e').keys).to eq(%i[encryption key date])
  end
  it 'will brute force to crack a message' do
    expect(@enigma.brute_force_crack('fuzqjguzcxyhwxpbylbtpjlurjth iquxinajinan ytxxhttouzcxyhwiju uionbxaetvkfvvstd,uueuvgiiipsnltanfeethhawubsiinwiybxblbhbubsibbxiipsiyuc,ivgiimmnuftwngyrkzkjmuurxh ecmttecglinheqclepfhtvstfwyty v nluxjjna,eebbhquafyjysnytyqckynzgegzuwauulx,uusmupmrxaerulmjfeemzlh cvjicgernleylhunltuuvwj.i hwinajijkjazgyictarfeexhecimucinafbummrmt“qjhxtehyw”—oikeaitanunxnytyxuwfuftmrg,tfunatcaaeqztmjlxqgulunhmejuxfguhkibbxifbknuhsibbxiipsizlyjny—ajmtfimmwjh jinrun,urjbuhsnuiwnnmci kjzoysbfrebitgnufjbupnbb,tfinrunuugszwyivgiipbhrinxivgiivmebbyeavfjinbrnuljwmyqnml.ekomeqztajmttwzttoummxmyeazgxnfyxauij mhsaupmxuuwnuoj stanfeelvifkfyex tqxidnwatfonywinajrltaxleiustfo un m,tfwy,tfyjuwnhmqg,uukbzkewimmrh enflj.i rtmikeyvoqxpbylb,tkxltnwmmfwxy,ekz fwupnbbtsnrmebitsxnanwa;tmrmtjanuynupfauhkinajimffufyxb;uajilusinhemcgjivmexnaj ufjw’mtyjweja,uusmuzfanysnyttwummngtfauuebiuig,urjbuuyibbxiyyfbbtnbuuuyzuwnytyqvmeqztmjytfibnsmlyiinatcmusmuktcwejaubsibuwmuwfab.tfbummnulfvztyrgy,eqztajmtfuftmrmtqr yexhyex tyqztrxmmeazgxnfyxa,uzfwnuxbcwfuuzjufhaaubsinajiqatuztirmmwrxm.erukjyzuy,icmeevlewimeannurybyg—najiguoxlbyguhkinajaztkjhmfanbhjftknfetemtf ztxqlyamuusmubsbzeqraysbuysxo m—komesolyimysazejamgjam,tfwytfijyhcfbf ugfbchsjftkxlfex tnbuysm',
                                     '011422')).to eq('03670')
  end
end
