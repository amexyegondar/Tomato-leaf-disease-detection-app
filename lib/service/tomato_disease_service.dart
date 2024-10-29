import 'package:image_classification/model/tomato_diseaes.dart';

List tomato_disease = [
  TomatoDisease(
      name: "የቲማቲም ቢጫ ቅጠል እሽክርክሪት ቫይረስ",
      cause: 'TYLCV የሚከሰተው የቤጎሞቫይረስ ጂነስ በሆነ ቫይረስ ነው።',
      prevention:
          'የነጭ ዝንቦችን ቁጥር ለመቀነስ ፀረ ተባይ መድኃኒቶችን፣ አንጸባራቂ ሙልቾችን እና ነፍሳትን የማይከላከሉ ስክሪኖችን ይጠቀሙ።',
      treatment:'ምንም ዓይነት የኬሚካል ሕክምና በ TYLCV ላይ ውጤታማ አይደለም. አስተዳደር የነጭ ፍላይ ቬክተርን በመከላከል እና በመቆጣጠር ላይ ያተኩራል።',
      imageURL: [
        'assets/images/Tomato_yellow_leaf_Virus.JPG',
        'assets/images/Tomato_yellow_leaf_Virus1.JPG'
      ]),
  TomatoDisease(
      name: "የቲማቲም ባክቴሪያ ነጠብጣብ",
      cause:
          'የባክቴሪያ ቦታ የሚከሰተው በበርካታ የ Xanthomonas ባክቴሪያ ዝርያዎች ነው።',
      prevention: 'ከበሽታ ነፃ የሆኑ ዘሮችን እና ንቅለ ተከላዎችን ይጠቀሙ፡ ዘር እና ንቅለ ተከላዎችን ከታመኑ ምንጮች ይግዙ።',
      treatment: 'የተበከሉ ተክሎችን ያስወግዱ እና ያጥፉ',
      imageURL: [
        'assets/images/Tomato_bac_spot.JPG',
        "assets/images/Tomato_bac_spot2.JPG"
      ]),
  TomatoDisease(
      name: "የቲማቲም ቀደምት እብጠት",
      cause: 'ቀደምት ጉንፋን የሚከሰተው በፈንገስ Alternaria solani ነው።',
      prevention: 'የሰብል ማሽከርከርን ይለማመዱ፡ ቲማቲም ወይም ተዛማጅ ተክሎችን በተከታታይ በአንድ ቦታ እንዳይተክሉ ሰብሎችን ማዞር።',
      treatment: 'እንደ ክሎሮታሎኒል፣ ማንኮዜብ ወይም መዳብ ላይ የተመሰረቱ ምርቶችን የመሳሰሉ ፀረ-ፈንገስ መድኃኒቶችን ይተግብሩ።',
      imageURL: ["assets/images/Tomato_early_bright.JPG","assets/images/Tomato_early_bright1.JPG"]),
  TomatoDisease(
      name: "የቲማቲም ዒላማ ቦታ", 
      cause: 'ፈንገስ በንፋስ, በዝናብ እና በተበከሉ መሳሪያዎች ይተላለፋል. እንዲሁም በእጽዋት ፍርስራሾች እና በአፈር ውስጥ ሊኖር ይችላል.', 
      prevention: 'ቲማቲም ወይም ተዛማጅ ሰብሎችን በተመሳሳይ ቦታ ለብዙ አመታት ከመትከል ይቆጠቡ።', 
      treatment: 'እንደ ክሎሮታሎኒል፣ ማንኮዜብ ወይም መዳብ ላይ የተመረኮዙ ምርቶችን በመሰየሚያው መመሪያ መሰረት ፀረ-ፈንገስ መድኃኒቶችን ይተግብሩ።',
       imageURL: ["assets/images/Tomato_Target_spot.JPG","assets/images/Tomato_Target_spot1.JPG"]),
];
