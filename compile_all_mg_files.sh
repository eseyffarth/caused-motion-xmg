################################################################################
# Execute this file in the XMG environment to create new resources that can be #
# used by TuLiPa during parsing.                                               #
################################################################################

# to compile the file that contains morphological information:
xmg compile mph --force ~/XMG-2/caused-motion-xmg/morph.mg

# to compile the file that contains the assignment of frames to lemmas:
xmg compile lex --force ~/XMG-2/caused-motion-xmg/lemma.mg

# to compile the file that contains the frames for individual lemmas, as well as
# the type hierarchy:
xmg compile synframe --force --more ~/XMG-2/caused-motion-xmg/frame_dimension.mg

# to compile the file that contains syntactic trees and their frames:
xmg compile synframe --force ~/XMG-2/caused-motion-xmg/syn_dimension.mg
