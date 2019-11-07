// Reading from the root tree 
// created November 5, 2019 - to read femb test output and Waveforms.
// Navaneeth Poonthottathil

#include "TApplication.h"
#include "TFile.h"
#include "TMath.h"
#include "TTree.h"
#include "TClonesArray.h"
#include "TLorentzVector.h"
#include "TH1F.h"
#include "TCanvas.h"
#include "TROOT.h"
#include "TSystem.h"
#include "TStyle.h"
#include <iomanip>
#include <iostream>
#include <algorithm>
#include <vector>
#include "TRandom.h"
#include <vector>
#include <iostream>

using namespace std;

void analyse()

{

   TFile*f =    TFile::Open("/dsk/1/data/oper/adcasic/adcTest_P1single_hothdaq4_cold/20191028T143306/adcTestData_20191028T143306_chipD3207_adcClock1_adcOffset-1_sampleRate1000000_functype1_freq0.000_offset1.000_amplitude0.000.root");

   std::vector<unsigned short> *wf = 0;

   TGraph *gCh_1;
   TGraph *gCh_2;
   TGraph *gCh_3;

   TCanvas* c1 = new TCanvas("c1", "c1",1400,800);
   TCanvas* c2 = new TCanvas("c2", "c2",1400,800);
   TCanvas* c3 = new TCanvas("c3", "c3",1400,800);

   gCh_1=new TGraph();
   gCh_2=new TGraph();
   gCh_3=new TGraph();

   TTree *T = (TTree*)f->Get("femb_wfdata");
   T->SetBranchAddress("wf", &wf);


   T->Print("wf");
   std::cout<<"size of the vector = "<<wf->size()<<std::endl;

   double mean = 0;
   int  count = 0;
   double rms = 0;

   Long64_t nEntries(T->GetEntries());

   T->GetEntry(0);

   for(Long64_t entry(0);entry<nEntries;++entry){

   T->GetEntry(entry);

      for( int s = 0 ; s < wf->size() ; s++ ) {

          double value = wf->at(s);
          if(  wf->at(s) < 10 ) continue;

          if( (wf->at(s) & 0x3F ) == 0x0 || (wf->at(s) & 0x3F ) == 0x3F ) continue;

           if ( (wf->at(s) & 0x3F ) == 0x0 || (wf->at(s) & 0x3F ) == 0x3F) {
  
           std::cout<< "the Value of Vector is = " << value << std::endl;
         
            }


     gCh_1->SetPoint(gCh_1->GetN(),gCh_1->GetN(),wf->at(s));
     gCh_2->SetPoint(gCh_2->GetN(),s,wf->at(s));

          }


      c1->cd();
      gCh_1->SetLineColor(kBlue);
                                                                               

     gCh_1->Draw("ALP");
     gCh_1->GetYaxis()->SetTitle("ADC counts");

     c2->cd();
     gCh_2->SetLineColor(kBlue);
     gCh_2->Draw("ALP");
     gCh_2->GetYaxis()->SetTitle("ADC counts");

}


   int numFftBins = 500;

   if( numFftBins > wf->size() )

   numFftBins = wf->size();

   TH1F *hData = new TH1F("hData","",numFftBins,0,numFftBins);


        for( int s = 0 ; s < numFftBins ; s++ ){

            double adc = gCh_1->Eval(s);

            hData->SetBinContent(s+1,adc);

             }


    TH1F *hFftData = new TH1F("hFftData","",numFftBins,0,numFftBins);
 
    hData->FFT(hFftData,"MAG");

      for(int i = 1 ; i < hFftData->GetNbinsX() ; i++ ){
        

          double freq = 2.* i / (double) hFftData->GetNbinsX() ;
          
          std::cout<< "FFT Frequcn  = " << freq << std::endl;
         
          gCh_3->SetPoint(gCh_3->GetN() , gCh_3->GetN() , freq );
    }:

c3->cd();

gCh_3->Draw("ALP");




//hFftData->Draw();

delete hData;
//delete hFftData;



c1->SaveAs("WF_adc_count_1.png");
c2->SaveAs("WF_adc_count_2.png");


}


