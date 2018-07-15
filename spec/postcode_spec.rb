require 'spec_helper'

describe 'Postcodesio' do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('TW106TF') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.status_message('TW106TF').code).to eq 200
      expect(@response['status']).to eq 200
      # p @postcodesio.status_message('TW106TF').code
      # expect(@postcodesio).to respond_to(:status_message)
    end

    it "should have a results hash" do
      expect(@response).to be_kind_of Hash
      # pending
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@response['result']['postcode'].gsub(/\s+/, "").length).to be_between(5,7) # removes white space from string
      # p @response['result']['postcode'].gsub(/\s+/, "")
      # pending
    end

    it "should return an quality key integer between 1-9" do
      expect(@response['result']['quality']).to be_between(1,9)
      # pending
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@response['result']['eastings']).to be_kind_of Integer
      # pending
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@response['result']['northings']).to be_kind_of Integer
      # pending
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@response['result']['country']).to eq("England").or(eq("Wales")).or(eq("Scotland")).or(eq("Northern Ireland"))
      # pending
    end

    it "should return a string value for NHS authority " do
      expect(@response['result']['nhs_ha']).to be_kind_of String
      # pending
    end

    it "should return a longitude float value" do
      expect(@response['result']['longitude']).to be_kind_of Float
      # pending
    end

    it "should return a latitude float value" do
      expect(@response['result']['latitude']).to be_kind_of Float
      # pending
    end

    it "should return a parliamentary constituency string" do
      expect(@response['result']['parliamentary_constituency']).to be_kind_of String
      # pending
    end

    it "should return a european_electoral_region string" do
      expect(@response['result']['european_electoral_region']).to be_kind_of String
      # pending
    end

    it "should return a primary_care_trust string" do
      expect(@response['result']['primary_care_trust']).to be_kind_of String
      # pending
    end

    it "should return a region string" do
      expect(@response['result']['region']).to be_kind_of String
      # pending
    end

    it "should return a parish string" do
      expect(@response['result']['parish']).to be_kind_of String
      # pending
    end

    it "should return a lsoa string" do
      expect(@response['result']['lsoa']).to be_kind_of String
      # pending
    end

    it "should return a msoa string" do
      expect(@response['result']['msoa']).to be_kind_of String
      # pending
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@response['result']['admin_district']).to be_kind_of String
      # pending
    end

    it "should return a incode string of three characters" do
      expect(@response['result']['incode']).to be_kind_of String
      expect(@response['result']['incode'].length).to eq 3
      # pending
    end

    it "should return a msoa string" do
      expect(@response['result']['msoa']).to be_kind_of String
      # pending
    end

    it "should return a incode string of 3-4 characters" do
      expect(@response['result']['incode']).to be_kind_of String
      expect(@response['result']['incode'].length).to be_between(3,4)
      # pending
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      arr = ['TW106TF','SE29UR']
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(arr) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
      expect(@response['status']).to eq 200
      # pending
    end

    it "should return the first query as the first postcode in the response" do
      expect(@response['result'][0]['query']).to eq ('TW106TF')
      # pending
    end

    it "should return the second query as the first postcode in the response" do
      expect(@response['result'][1]['query']).to eq ('SE29UR')
      # p @response['result'][1]['query']
      # pending
    end

    it "should have a results hash" do
      @response['result'].each do |each_result|
        # expect(each_result).to be_kind_of Hash
        # p each_result.class
      end
      # pending
    end

    it "should return a postcode between 5-7 in length"  do
      @response['result'].each do |each_result|
        expect(each_result['result']['postcode'].gsub(/\s+/, "").length).to be_between(5,7)
      end
      # pending
    end

    it "should return an quality key integer between 1-9" do
      @response['result'].each do |each_result|
        expect(each_result['result']['quality']).to be_between(1,9)
      end
      # pending
    end

    it "should return an ordnance survey eastings value as integer" do
      @response['result'].each do |each_result|
        expect(each_result['result']['eastings']).to be_kind_of Integer
      end
      # pending
    end

    it "should return an ordnance survey northings value as integer" do
      @response['result'].each do |each_result|
        expect(each_result['result']['northings']).to be_kind_of Integer
      end
      # pending
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      @response['result'].each do |each_result|
        expect(each_result['result']['country']).to eq("England").or(eq("Wales")).or(eq("Scotland")).or(eq("Northern Ireland"))
      end
      # pending
    end

    it "should return a string value for NHS authority " do
      @response['result'].each do |each_result|
        expect(each_result['result']['nhs_ha']).to be_kind_of String
      end
      # pending
    end

    it "should return a longitude float value" do
      @response['result'].each do |each_result|
        expect(each_result['result']['longitude']).to be_kind_of Float
      end
      # pending
    end

    it "should return a latitude float value" do
      @response['result'].each do |each_result|
        expect(each_result['result']['latitude']).to be_kind_of Float
      end
      # pending
    end

    it "should return a parliamentary constituency string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['parliamentary_constituency']).to be_kind_of String
      end
      # pending
    end

    it "should return a european_electoral_region string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['european_electoral_region']).to be_kind_of String
      end
      # pending
    end

    it "should return a primary_care_trust string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['primary_care_trust']).to be_kind_of String
      end
      # pending
    end

    it "should return a region string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['region']).to be_kind_of String
      end
      # pending
    end

    it "should return a parish string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['parish']).to be_kind_of String
      end
      # pending
    end

    it "should return a lsoa string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['lsoa']).to be_kind_of String
      end
      # pending
    end

    it "should return a msoa string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['msoa']).to be_kind_of String
      end
      # pending
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['admin_district']).to be_kind_of String
      end
      # pending
    end

    it "should return a incode string of three characters" do
      @response['result'].each do |each_result|
        expect(each_result['result']['incode']).to be_kind_of String
        expect(each_result['result']['incode'].length).to eq 3
      end
      # pending
    end

    it "should return a msoa string" do
      @response['result'].each do |each_result|
        expect(each_result['result']['msoa']).to be_kind_of String
      end
      # pending
    end

    it "should return a incode string of 3-4 characters" do
      @response['result'].each do |each_result|
        expect(each_result['result']['incode']).to be_kind_of String
        expect(each_result['result']['incode'].length).to be_between(3,4)
      end
      # pending
    end
  end


end
