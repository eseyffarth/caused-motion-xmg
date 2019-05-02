% COMPILE WITH: lex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the lemmas we want the parser to understand, and each     %
% lemma is connected to:                                                       %         
% 1. its semantic frame (as specified in the frame dimension)                  % 
% 2. its syntactic category (roughly: part of speech)                          %
% 3. the syntactic tree(s) it can anchor - there can be more than one!         % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%
%%% NOUNS AND NAMES %%%
%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The lemma John will be activated when we read the token "John".              %
%                                                                              %
% We will assign the "John frame" to this element in the sentence.             %
%                                                                              %
% The token "John" can anchor a tree if the anchor node of the tree has the    %
%   same syntactic category as this lemma (n).                                 %
%                                                                              %
% The only tree family that can be anchored by "John" is propernoun (as        %
%   defined in the syntactic dimension).                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class LemmaJohn
{
    <lemma> {
        entry <- "john";
        sem <- FrameJohn;
        cat <- n;
        fam <- propernoun
    }
}

class LemmaMary
{
    <lemma> {
        entry <- "mary";
        sem <- FrameMary;
        cat <- n;
        fam <- propernoun
    }
}

class LemmaBill
{
    <lemma> {
        entry <- "bill";
        sem <- FrameBill;
        cat <- n;
        fam <- propernoun
    }
}

class LemmaSylvia
{
    <lemma> {
        entry <- "sylvia";
        sem <- FrameSylvia;
        cat <- n;
        fam <- propernoun
    }
}

class LemmaDoor
{
    <lemma> {
        entry <- "door";
        sem <- FrameDoor;
        cat <- n;
        fam <- commonnoun
    }
}


class LemmaHorse
{
    <lemma> {
        entry <- "horse";
        sem <- FrameHorse;
        cat <- n;
        fam <- commonnoun
    }
}



class LemmaStage
{
    <lemma> {
        entry <- "stage";
        sem <- FrameStage;
        cat <- n;
        fam <- commonnoun
    }
}

class LemmaFence
{
    <lemma> {
        entry <- "fence";
        sem <- FrameFence;
        cat <- n;
        fam <- commonnoun
    }
}

%%%%%%%%%%%%%
%%% VERBS %%%
%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The lemma dance will be activated when we read the token "dance", or one of  %
%   its inflected forms.                                                       %
%                                                                              %
% We will assign the "Dance frame" to this element in the sentence.            %
%                                                                              %
% The token "dance" can anchor a tree if the anchor node of the tree has the   %
%   same syntactic category as this lemma (v).                                 %
%                                                                              %
% The tree families that can be anchored by "dance" are:                       % 
%   n0v, BareVerbProjection, DirectedVerbProjection, n0vpp,                    % 
%   MotionCausingVerbProjection, n0vn1pp (as defined in the syntactic          %
%   dimension).                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class LemmaDance
{
    <lemma> {
        entry <- "dance";
        sem <- FrameDance;
        cat <- v;
        fam <- n0V | fam <- BareVerbProjection | fam <- DirectedVerbProjection |
               fam <- n0Vpp | fam <- MotionCausingVerbProjection
    }
}


class LemmaJump
{
    <lemma> {
        entry <- "jump";
        sem <- FrameJump;
        cat <- v;
        fam <- n0V | fam <- BareVerbProjection | fam <- n0Vpp |
        fam <- ActionInducingVerbProjection | fam <- n0Vn1pp_actioninducing
    }
}
        
class LemmaSing
{
    <lemma> {
        entry <- "sing";
        sem <- FrameSing;
        cat <- v;
        fam <- n0V | fam <- BareVerbProjection | 
                fam <- MotionCausingVerbProjection
    }
}

class LemmaLaugh
{
    <lemma> {
        entry <- "laugh";
        sem <- FrameLaugh;
        cat <- v;
        fam <- n0V | fam <- BareVerbProjection | 
                fam <- MotionCausingVerbProjection
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DETERMINERS AND PREPOSITIONS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class LemmaThe
{
	<lemma> {
    entry <- "the";
    sem <- FrameDummy;
    cat   <- det;
    fam   <- Determiners
	}
}

class LemmaTo
{
	<lemma> {
    entry <- "to";
    sem <- FrameTo;
    cat   <- p;
    fam   <- PrepositionPhrase
	}
}

class LemmaOver
{
	<lemma> {
    entry <- "over";
    sem <- FrameOver;
    cat   <- p;
    fam   <- PrepositionPhrase
	}
}
class LemmaOff
{
	<lemma> {
    entry <- "off";
    sem <- FrameOff;
    cat   <- p;
    fam   <- PrepositionPhrase
	}
}


value LemmaJohn
value LemmaMary
value LemmaBill
value LemmaSylvia
value LemmaDance
value LemmaSing
value LemmaLaugh
% value LemmaArgue
value LemmaJump
value LemmaDoor
value LemmaHorse
value LemmaFence

value LemmaStage

value LemmaThe
value LemmaTo
value LemmaOver
value LemmaOff