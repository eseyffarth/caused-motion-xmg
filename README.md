# caused-motion-xmg
A TAG grammar fragment that models the caused-motion construction and the induced action alternation. Both phenomena allow English verbs to be used in causative ways even if they do not lexically encode causation.

The grammar and the phenomena are described in detail in the following paper. Please cite this work as: 

Esther Seyffarth (2019). Modeling the Induced Action Alternation and the Caused-Motion Construction with Tree Adjoining Grammar (TAG) and Semantic Frames. In *Proceedings of CSTFRS - Computing Semantics with Types, Frames and Related Structures*, IWCS 2019, Gothenburg, Sweden.

# How to use
The files with the extension `.mg` contain metagrammar rules. They can be compiled using [XMG-2](https://github.com/spetitjean/XMG-2/wiki) to produce `.xml` files. Use the script `compile_all_mg_files.sh` to compile the grammar.

The `.xml` files can be loaded with [TuLiPA](https://github.com/spetitjean/TuLiPA-frames/wiki) in order to parse sentences or documents.

Once TuLiPA is installed and the grammar files are compiled, use the script `demo.sh` to parse the file `corpus.txt` to check if everything works.