% COMPILE WITH: mph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the inflected forms we want the parser to understand, and %
% each form is connected to:                                                   %         
% 1. its lemma (as specified in the lemma lexion)                              % 
% 2. its syntactic category (roughly: part of speech)                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% "danced" is an inflected form of the lemma "dance". It belongs to the
% syntactic category v.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class MorphDanced
{
    <morpho> {
        morph <- "danced";
        lemma <- "dance";
        cat <- v
    }
}

class MorphDance
{
    <morpho> {
        morph <- "dance";
        lemma <- "dance";
        cat <- v
    }
}

class MorphSang
{
    <morpho> {
        morph <- "sang";
        lemma <- "sing";
        cat <- v
    }
}

class MorphSing
{
    <morpho> {
        morph <- "sing";
        lemma <- "sing";
        cat <- v
    }
}

class MorphJumped
{
    <morpho> {
        morph <- "jumped";
        lemma <- "jump";
        cat <- v
    }
}

class MorphJump
{
    <morpho> {
        morph <- "jump";
        lemma <- "jump";
        cat <- v
    }
}

class MorphLaughed
{
    <morpho> {
        morph <- "laughed";
        lemma <- "laugh";
        cat <- v
    }
}

class MorphLaugh
{
    <morpho> {
        morph <- "laugh";
        lemma <- "laugh";
        cat <- v
    }
}

class MorphJohn
{
  <morpho> {
    morph <- "John";
    lemma <- "john";
    cat   <- n
   }
}

class MorphMary
{
  <morpho> {
    morph <- "Mary";
    lemma <- "mary";
    cat   <- n
   }
}

class MorphBill
{
  <morpho> {
    morph <- "Bill";
    lemma <- "bill";
    cat   <- n
   }
}

class MorphSylvia
{
  <morpho> {
    morph <- "Sylvia";
    lemma <- "sylvia";
    cat   <- n
   }
}

class MorphDoor
{
  <morpho> {
    morph <- "door";
    lemma <- "door";
    cat   <- n
   }
}

class MorphHorse
{
  <morpho> {
    morph <- "horse";
    lemma <- "horse";
    cat   <- n
   }
}

class MorphFence
{
  <morpho> {
    morph <- "fence";
    lemma <- "fence";
    cat   <- n
   }
}

class MorphStage
{
  <morpho> {
    morph <- "stage";
    lemma <- "stage";
    cat   <- n
   }
}

class MorphThe
{
  <morpho> {
    morph <- "the";
    lemma <- "the";
    cat   <- det
   }
}

class MorphTo
{
  <morpho> {
    morph <- "to";
    lemma <- "to";
    cat   <- p
   }
}

class MorphOver
{
  <morpho> {
    morph <- "over";
    lemma <- "over";
    cat   <- p
   }
}

class MorphOff
{
  <morpho> {
    morph <- "off";
    lemma <- "off";
    cat   <- p
   }
}


value MorphDanced
value MorphDance
value MorphSang
value MorphSing
value MorphJumped
value MorphJump
value MorphLaughed
value MorphLaugh
% value MorphArgued
value MorphJohn
value MorphMary
value MorphBill
value MorphSylvia
value MorphDoor
value MorphHorse
value MorphFence

value MorphStage

value MorphThe
value MorphTo
value MorphOver
value MorphOff