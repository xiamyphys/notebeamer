## Note template imitated from Goodnotes made by LaTeX
###### Author: [Axia](mailto:xiamyphys@gmail.com)
#### Introduction
In order to improve the efficiency of taking notes on iPad in class and focus more on the teacher's lecture rather than taking notes, we developed this one-click template for importing courseware. The left side is the courseware and the right side is the annotation area.

At the same time, the cover of the note is modeled on Goodnotes, and the title, author, and email address can be customized.

#### Designs
Note paper provides two options, namely `beamer` and `slidev`

##### `beamer` option
This option is suitable for courseware with a screen ratio of approximately 4:3 and is designed to be **three beamers per page**.

##### `slidev` option
This option is suitable for courseware with a screen ratio of approximately 16:9 and is designed to be **four beamers per page**.

##### blank page
Supports generating left and right equal-width double-column blank pages

##### Cover design
Based on the official Goodnotes, several other color covers have been added.

|Options|Color|Options|Color|
| :-: | :-: | :-: | :-: |
|1号色|Green|5号色|Purple|
|2号色|Cyan|6号色|Sakura|
|3号色|Light Blue|7号色|Light Yellow|
|4号色|Dark Blue|8号色|Brown|

#### Command introduction
##### Set author & email
- `\author{Axia}`
- `\mail{xiamyphys@gmail.com}`
- The cover after the above command will display the corresponding author & email address. If the above command is used again after generating the cover, the author & email address displayed on the subsequently generated cover will be provided by the latest command, but the information on the previous cover will not change.
##### Generate cover
- `\flyleaf{titlepage.pdf}`
- This command is used to insert a title page. By default, a circle title page in Goodnotes is provided.
- `\notebook{2号色}{Advanced Quantum Mechanics}`
- The first option is the cover color, the second option is the cover title
  ![demo1-1](https://github.com/xiamyphys/Note-template-imitated-from-Goodnotes-made-by-LaTeX-/assets/134639741/37cf1e86-7ef2-4d11-b030-2ec7ee637649)

##### Chapter settings
- By default, this template corresponds to one courseware file according to one chapter.
- `\chapter{Introduction \& Fundamental Concepts}{AQM.pdf}`
- The first option is the chapter title, which will be displayed above the subsequent note paper; the second option is the PDF file to be imported for this chapter
##### Import courseware
- `\newnote{1}{2}{3} \newnote{4}{5}{5}`
- The default is to import 3 coursewares per page. If there are 5 coursewares in the chapter to be imported, the final command is `\newnote{4}{5}{5}`. The last option needs to use the page number of the last page of the courseware.
  ![demo1-3](https://github.com/xiamyphys/Note-template-imitated-from-Goodnotes-made-by-LaTeX-/assets/134639741/f1bef7bc-4b63-4fab-b7d4-2efcb5379ed2)
  ![demo1-4](https://github.com/xiamyphys/Note-template-imitated-from-Goodnotes-made-by-LaTeX-/assets/134639741/c5469f55-6e68-452c-b1ca-5ee6d0683b13)
- If the global option `slidev` is enabled, 4 coursewares need to be inserted into each page, and the command is `\newnote{1}{2}{3}{4}`
  ![demo2-2](https://github.com/xiamyphys/Note-template-imitated-from-Goodnotes-made-by-LaTeX-/assets/134639741/9d572191-e72c-4107-b6b2-1a23481af710)

##### Generate blank page
- `\clearnote`
##### Small stickers
   - `\sticker{Inuyasa.jpg}`
   - A small sticker of your favorite will be inserted in the lower right corner of the page after this command. A small sticker of Inuyasha is provided by default.
##### More features are under development...Happy $\LaTeX$ ing😊
