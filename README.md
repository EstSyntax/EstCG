# EstCG

Tools and resources for Estonian Constraint Grammar

Eesti keele Kitsenduste Grammatika (CG) süntaksianalüsaator

## 2017/18. a versioon

./parser17.sh failinimi

luuakse failinimi.cg3

Failis parser17. sh on vaja morfoloogiaanalüsaatori (vabamorf) ja skriptide asukohad kirjutada RADA muutujatesse, samuti failis rtolkija.pl on vaja muuta faili tmorftrtabel.txt täpne asukoht (rada).

Et saada eelmise versiooniga samaväärne väljund, kus rektsiooniinfo on kustutatud, võib lisada skripti rea kaheks viimaseks väljakutsutavaks programmiks $RADA/1reaks.pl | $RADA/inforemover.pl


Väljund kirjutatakse faili sisend.cg3, väljundi seletus: https://korpused.keeleressursid.ee/syntaks/dokumendid/syntaksiliides_ee.pdf. Põhjalikumat märgenduspõhimõtete kirjeldust leiab Eesti keele sõltuvuspuude panga dokumentatsioonis: https://www.keeletehnoloogia.ee/et/ekt-projektid/vahendid-teksti-mitmekihiliseks-margendamiseks-rakendatuna-koondkorpusele/soltuvussuntaktiliselt-analuusitud-korpus.

Süntaktilise analüüsi jaoks on vajalik eesti keele morfoloogiline analüsaator, nt Vabamorf: https://github.com/Filosoft/vabamorf  ning VISL CG3 Kitsenduste Grammatika analüsaator: http://beta.visl.sdu.dk/constraint_grammar.html. 

Analüsaatorit saab kasutada ka veebiliidese kaudu: https://korpused.keeleressursid.ee/syntaks/index.php.

Küsimuste korral kirjutage kaili.muurisep@ut.ee

Autorid: Kaili Müürisep ja Tiina Puolakainen