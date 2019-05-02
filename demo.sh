######################################################################################
# run the parser with an input corpus (one sentence per line, no punctuation, all    #
# with s as axiom):                                                                  #
######################################################################################

java -jar "tulipa-frames.jar" -b corpus.txt -cyktag -xg -g syn_dimension.xml -f frame_dimension.xml -th more.mac -l lemma.xml -m morph.xml -a s
