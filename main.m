clear all;
close all;

dataset = load('ml-100k/u.data');

numberOfUser = size(unique(dataset(:,1)));

numberOfItem = size(unique(dataset(:,2)));

userSize = numberOfUser(1,1);
itemSize = numberOfItem(1,1);

mainMatrix = ones (userSize,itemSize)* -1 ;

for i = 1 :100000
        mainMatrix(dataset(i,1),dataset(i,2)) = dataset(i,3);
end

%% Section-2 -----------   Calculate And Find Optimum K Value

% *************************** USER-BASED CF ***************************

% HoldOneErrorMean = zeros(10,8);
% 
% KisTen = FoldUser(mainMatrix,10);
% HoldOneErrorMean(1,1:8) = FoldError(KisTen);
% 
% SecondTestSwap = UserSwapTenFold(mainMatrix,94,2);
% KisTwenty = FoldUser(SecondTestSwap,10);
% HoldOneErrorMean(2,1:8) = FoldError(KisTwenty);
% 
% ThirdTestSwap = UserSwapTenFold(mainMatrix,94,3);
% KisThirdy = FoldUser(ThirdTestSwap,10);
% HoldOneErrorMean(3,1:8) = FoldError(KisThirdy);
% 
% FourthTestSwap = UserSwapTenFold(mainMatrix,94,4);
% KisFourth = FoldUser(FourthTestSwap,10);
% HoldOneErrorMean(4,1:8) = FoldError(KisFourth);
% 
% FifthTestSwap = UserSwapTenFold(mainMatrix,94,5);
% KisFifth = FoldUser(FifthTestSwap,10);
% HoldOneErrorMean(5,1:8) = FoldError(KisFifth);
% 
% SixthTestSwap = UserSwapTenFold(mainMatrix,94,6);
% KisSixth = FoldUser(SixthTestSwap,10);
% HoldOneErrorMean(6,1:8) = FoldError(KisSixth);
% 
% SeventhTestSwap = UserSwapTenFold(mainMatrix,94,7);
% KisSeventh = FoldUser(SeventhTestSwap,10);
% HoldOneErrorMean(7,1:8) = FoldError(KisSeventh);
% 
% EighthTestSwap = UserSwapTenFold(mainMatrix,94,8);
% KisEighth = FoldUser(EighthTestSwap,10);
% HoldOneErrorMean(8,1:8) = FoldError(KisEighth);
% 
% NinethTestSwap = UserSwapTenFold(mainMatrix,94,9);
% KisNineth = FoldUser(NinethTestSwap,10);
% HoldOneErrorMean(9,1:8) = FoldError(KisNineth);
% 
% TenthTestSwap = UserSwapTenFold(mainMatrix,94,10);
% KisTenth = FoldUser(TenthTestSwap,10);
% HoldOneErrorMean(10,1:8) = FoldError(KisTenth);
% 
% Last = FoldError(HoldOneErrorMean);
% 
% % So,If a transaction error has occurred,K may vary.

%% Section-3 -----------   Calculate And Find Optimum K Value    

% *************************** ITEM-BASED CF ***************************

% HoldOneErrorMean = zeros(10,8);
% 
% ItemKisTen = FoldItem(mainMatrix,10);
% HoldOneErrorMean(1,1:8) = FoldError(ItemKisTen);
% 
% SwapTwo = ItemSwapTenFold(mainMatrix,2,168);
% ItemKisTwo = FoldItem(SwapTwo,10);
% HoldOneErrorMean(2,1:8) = FoldError(ItemKisTwo);
% 
% SwapThree = ItemSwapTenFold(mainMatrix,3,168);
% ItemKisThree = FoldItem(SwapThree,10);
% HoldOneErrorMean(3,1:8) = FoldError(ItemKisThree);
% 
% SwapFour = ItemSwapTenFold(mainMatrix,4,168);
% ItemKisFour = FoldItem(SwapFour,10);
% HoldOneErrorMean(4,1:8) = FoldError(ItemKisFour);
% 
% SwapFifth = ItemSwapTenFold(mainMatrix,5,168);
% ItemKisFifth = FoldItem(SwapFifth,10);
% HoldOneErrorMean(5,1:8) = FoldError(ItemKisFifth);
% 
% SwapSixth = ItemSwapTenFold(mainMatrix,6,168);
% ItemKisSixth = FoldItem(SwapSixth,10);
% HoldOneErrorMean(6,1:8) = FoldError(ItemKisSixth);
% 
% SwapSeven = ItemSwapTenFold(mainMatrix,7,168);
% ItemKisSeventh = FoldItem(SwapSeven,10);
% HoldOneErrorMean(7,1:8) = FoldError(ItemKisSeventh);
% 
% SwapEight = ItemSwapTenFold(mainMatrix,8,168);
% ItemKisEighth = FoldItem(SwapEight,10);
% HoldOneErrorMean(8,1:8) = FoldError(ItemKisEighth);
% 
% SwapNine = ItemSwapTenFold(mainMatrix,9,168);
% ItemKisNineth = FoldItem(SwapNine,10);
% HoldOneErrorMean(9,1:8) = FoldError(ItemKisNineth);
% 
% SwapTen = ItemSwapTenFold(mainMatrix,10,168);
% ItemKisHundred = FoldItem(SwapTen,10);
% HoldOneErrorMean(10,1:8) = FoldError(ItemKisHundred);
% 
% Last = FoldError(HoldOneErrorMean);

% So,If a transaction error has occurred,K may vary.

%% Section-4 -----------  Read Test User Rating on Web Application

Test = zeros(1,1682);

Test(1,csvread('StoredUserRate/movie1.csv')) = csvread('StoredUserRate/write1.csv');
Test(1,csvread('StoredUserRate/movie2.csv')) = csvread('StoredUserRate/write2.csv');
Test(1,csvread('StoredUserRate/movie3.csv')) = csvread('StoredUserRate/write3.csv');
Test(1,csvread('StoredUserRate/movie4.csv')) = csvread('StoredUserRate/write4.csv');
Test(1,csvread('StoredUserRate/movie5.csv')) = csvread('StoredUserRate/write5.csv');
Test(1,csvread('StoredUserRate/movie6.csv')) = csvread('StoredUserRate/write6.csv');
Test(1,csvread('StoredUserRate/movie7.csv')) = csvread('StoredUserRate/write7.csv');
Test(1,csvread('StoredUserRate/movie8.csv')) = csvread('StoredUserRate/write8.csv');
Test(1,csvread('StoredUserRate/movie9.csv')) = csvread('StoredUserRate/write9.csv');
Test(1,csvread('StoredUserRate/movie10.csv')) = csvread('StoredUserRate/write10.csv');
Test(1,csvread('StoredUserRate/movie11.csv')) = csvread('StoredUserRate/write11.csv');
Test(1,csvread('StoredUserRate/movie12.csv')) = csvread('StoredUserRate/write12.csv');
Test(1,csvread('StoredUserRate/movie13.csv')) = csvread('StoredUserRate/write13.csv');
Test(1,csvread('StoredUserRate/movie14.csv')) = csvread('StoredUserRate/write14.csv');
Test(1,csvread('StoredUserRate/movie15.csv')) = csvread('StoredUserRate/write15.csv');
Test(1,csvread('StoredUserRate/movie16.csv')) = csvread('StoredUserRate/write16.csv');
Test(1,csvread('StoredUserRate/movie17.csv')) = csvread('StoredUserRate/write17.csv');
Test(1,csvread('StoredUserRate/movie18.csv')) = csvread('StoredUserRate/write18.csv');
Test(1,csvread('StoredUserRate/movie19.csv')) = csvread('StoredUserRate/write19.csv');
Test(1,csvread('StoredUserRate/movie20.csv')) = csvread('StoredUserRate/write20.csv');

%% Section-5 -----------   Suggestion Movie ID.

 ItemSuggested = LetsSuggestItem(mainMatrix,Test,10);

 UserSuggested = LetsSuggestUser(mainMatrix,Test,80);

%% Section-6 -----------  Saved Suggested to (CSV or Text or Another Type)

AllSuggest = [UserSuggested, ItemSuggested]; 
csvwrite('SuggestedResult.csv', AllSuggest);

% That's Finished.

