% COMPILE WITH: synframe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the syntactic trees of our grammar and connects them to   %  
% their frames. Individual slots of these frames will be filled with frames    %
% from the frame lexicon (frame_dimension.mg), according to the tokens that    %
% are being parsed.                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

type MARK = {subst, nadj, anchor, coanchor, lex, foot} % This is how we specify
                                                       % some special functions
                                                       % of nodes.

type CAT = {n, np, v, vp, s, pp, p, d, adj, det}    % This is how we specify
                                                    % the syntactic type of a 
                                                    % node.

type LABEL !              % We create a type "label" that contains any sequence
                          % of characters. This is used in the interface
                          % features (see below).

property mark : MARK

% Syntactic Features
feature cat : CAT

% Interface Features
feature argactor : LABEL
feature argmover : LABEL
feature argpath : LABEL
feature argcause : LABEL
feature argtheme : LABEL     

feature i : LABEL
feature e : LABEL

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRAME HIERARCHY                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frame-types = {activity, physical_object, person, name, manner, actor, mover, 
                translocation, landmark, trajectory, path, causation}

frame-constraints = {
% Attribute constraints:
activity -> actor: +,       % each activity must have an ACTOR attribute
person ->  name: +          % each person must have a NAME attribute
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TREE FRAGMENTS:                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class Subject
export ?S ?VP ?SubjNP ?SubjMark ?A
declare ?S ?VP ?SubjNP ?SubjMark ?A
{ <syn> {
	node ?S [cat=s] {
		node ?SubjNP (mark=SubjMark) [cat=np, i=?A]
		node ?VP [cat=vp]
	}
  };
  <iface>{[argactor=?A]}
  % We need an interface here, otherwise the actor cannot be unified with the
  % rest of the frame. Whatever is the identity of the thing that substitutes
  % to the SubjNP node will be coindexed with the argactor.
}


class BareVerbProjection
export ?VP ?V ?F
declare ?VP ?V ?F 
{ <syn> {
  node ?VP [cat=vp]{
		node ?V (mark=anchor) [cat=v]
	}
  }

}

class Object    
export ?VP ?V ?ObjNP ?ObjMark
declare ?VP ?V ?ObjNP ?ObjMark ?I
{ <syn> {
	node ?VP [cat=vp] {	
		node ?V [cat=v]
		node ?ObjNP (mark=ObjMark) [cat=np,i=?I]
	}
  }
}


class determiner
export ?NP1 ?NP2 ?Det
declare ?NP1 ?NP2 ?Det
{<syn>{
  node ?NP1 [cat=np];   % "original" NP node
  node ?Det (mark=anchor) [cat=det];  
  node ?NP2 (mark=foot) [cat=np];  % "new" NP node
  ?NP1 -> ?Det;
  ?NP1 -> ?NP2;
  ?Det >> ?NP2
	}
}

class directedverb  
export ?VP ?PP ?V ?X ?Y ?F
declare ?VP ?PP ?V ?X ?Y ?F
{
  <syn>{
    node ?VP [cat=vp];
    node ?V (mark=anchor) [cat=v];
    node ?PP [cat=pp, i=?Y]; % We need this because the PP contains a frame that we want to embed
    ?VP -> ?V;
    ?VP -> ?PP;
    ?V >> ?PP
  }; 
  <iface>{[e=?F, argactor=?X, argmover=?X]}
}  

class motioncausingverb
export ?VP ?PP ?V ?NP ?X ?Y ?G ?F ?Z
declare ?VP ?PP ?V ?NP ?X ?Y ?G ?F ?Z
{
  <syn>{
    node ?VP [cat=vp];
    node ?V (mark=anchor) [cat=v,e=?G];
    node ?NP [cat=np,i=?Z]; % The object's frame is the mover.
    node ?PP [cat=pp,i=?Y]; % Grab the frame for the path here.
    ?VP -> ?V;
    ?VP -> ?NP;
    ?VP -> ?PP;
    ?V >> ?NP;
    ?NP >> ?PP
  };
  <iface>{[argactor=?X, e=?G]}   
}

class actioninducingverb  
export ?VP ?PP ?V ?NP ?X ?Y ?G ?Z
declare ?VP ?PP ?V ?NP ?X ?Y ?G ?Z
{
  <syn>{
    node ?VP [cat=vp];
    node ?V (mark=anchor) [cat=v,e=?G];
    node ?NP [cat=np,i=?Z]; % Grab the frame for the mover here.
    node ?PP [cat=pp,i=?Y]; % Grab the frame for the path here.
    ?VP -> ?V;
    ?VP -> ?NP;
    ?VP -> ?PP;
    ?V >> ?NP;
    ?NP >> ?PP
  };
  <iface>{[argmover=?Z, e=?G]}   
}

class preposition
export ?PP ?NP ?P ?Z ?Y ?T
declare ?PP ?NP ?P ?Z ?Y ?T
{<syn>{
  node ?PP [cat=pp, i=?T];
  node ?P (mark=anchor) [cat=p]; % Grab the path frame from the preposition here.
                          % It comes with a trajectory, but no landmark.
  node ?NP [cat=np, i=?Z];    % Grab the frame for the landmark from here.
  ?PP -> ?P;
  ?PP -> ?NP;
  ?P >> ?NP
  };
  <frame>{?T[path,
        landmark:?Z] % Simplified: The path is defined relative to the landmark.
                     % The trajectory describes the movement relative to the
                     % landmark, which is the NP of this PP.
  };
  <iface>{[argpath=?T, i=?T]}   % The frame of the PP is made available through the
                          % interface.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TREE TEMPLATES:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOMEONE VERBS                                                                %
% This class grabs the partial frames from the tokens that are being parsed.   %
% The frame for the syntactic structure (S (NP VP (V)) is defined below.       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class alphanx0V
import Subject[] BareVerbProjection[]
declare ?F ?X
{
  ?SubjMark=subst;
    <iface>{[cat=v, e=?F, argactor=?X]};
    <frame>{?F[activity,
              actor:?X]}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOMEONE VERBS SOMEONE                                                        %
% This class grabs the partial frames from the tokens that are being parsed.   %
% The frame for the syntactic structure (S (NP VP (V NP))) is defined below.   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class alphanx0Vnx1_mark
import Subject[] BareVerbProjection[] Object[]
class alphanx0Vnx1
import alphanx0Vnx1_mark[]
declare ?X ?Y ?F
{
	?SubjMark=subst;
	?ObjMark=subst;
  <iface>{[cat=v, e=?F, argactor=?X, argtheme=?Y]};
  <frame>{?F[activity]}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOMEONE VERBS SOMEWHERE                                                      %
% This class grabs the partial frames from the tokens that are being parsed.   %
% The frame for the syntactic structure (S (NP VP (V PP))) is defined below.   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class alphanx0Vpp_mark
import Subject[] directedverb[]
class alphanx0Vpp 
import alphanx0Vpp_mark[]
declare ?X ?Y ?F
{
  ?SubjMark=subst; 
  <iface>{[cat=v, e=?F, argactor=?X, argmover=?X, argpath=?Y]};  
  <frame>{?F[translocation,
          actor:?X,
          mover:?X,
          path:?Y]} 
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOMEONE VERBS SOMEONE SOMEWHERE                                              %
% This class grabs the partial frames from the tokens that are being parsed.   %
% The frame for the syntactic structure (S (NP VP (V NP PP))) is defined below.%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class alphanx0Vn1pp_motioncausing
import Subject[] motioncausingverb[]
{
  ?SubjMark=subst; 
  <frame>{
      [causation,
        cause:
          ?G[activity,  % More info on the activity is provided by the verb in
                        % the sentence.
          actor:?X],    % More info on the actor is provided by the subject of
                        % the sentence.
        effect:
          [translocation,
          mover:?Z,     % More info on the mover is provided by the "object" of
                        % the sentence.
          path:?Y]      % More info on the path is provided by the PP.
      ]
      }
}

class alphanx0Vn1pp_actioninducing
import Subject[] actioninducingverb[]
{
  ?SubjMark=subst; 
  <iface>{[cat=v, argactor=?X, e=?G]}; 
  <frame>{
      [causation,
        cause:
          [activity,  % More info on the activity is provided by the verb in
                        % the sentence.
          actor:?X],    % More info on the actor is provided by the subject of
                        % the sentence.
        effect:
          ?G[translocation,
          mover:?Z,     % More info on the mover is provided by the "object" of
                        % the sentence.
          actor:?Z,
                        
          path:?Y]      % More info on the path is provided by the PP.
      ]
      }
}

class propernoun
declare ?NP ?N ?X0
{
  <syn>{
    node ?NP [cat=np, i=?X0];
    node ?N (mark=anchor) [cat=n];
    ?NP -> ?N
  };
  <iface>{
    [i=?X0]   % The frame for the noun (e.g. John) is made available through the
              % interface.
  }
}

class commonnoun
declare ?NP ?N ?X0
{
  <syn>{
    node ?NP [cat=np, i=?X0];
    node ?N (mark=anchor) [cat=n];
    ?NP -> ?N
  };
  <iface>{
    [i=?X0]
  }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TREE FAMILIES:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class n0V
{
  alphanx0V[] | alphanx0Vn1pp_motioncausing[]
}

class n0Vn1
{
  alphanx0Vnx1[]
}

class Determiners
export ?Tree
declare ?Tree
{
	?Tree = determiner[]
}

class DirectedVerbProjection
export ?Tree
declare ?Tree
{
	?Tree = directedverb[]
}

class MotionCausingVerbProjection
export ?Tree
declare ?Tree
{
	?Tree = motioncausingverb[]
}

class ActionInducingVerbProjection
export ?Tree
declare ?Tree
{
	?Tree = actioninducingverb[]
}

class PrepositionPhrase
export ?Tree
declare ?Tree
{
  ?Tree = preposition[]
}

class n0Vpp
{
  alphanx0Vpp[]
}

class n0Vn1pp
{
  alphanx0Vn1pp_motioncausing[]
}

class n0Vn1pp_actioninducing
{
  alphanx0Vn1pp_actioninducing[]
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EVALUATION: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


value n0V
value n0Vn1
value n0Vpp
value n0Vn1pp
value n0Vn1pp_actioninducing

value Subject
value BareVerbProjection
value DirectedVerbProjection
value MotionCausingVerbProjection
value ActionInducingVerbProjection

value Determiners
value PrepositionPhrase

value commonnoun
value propernoun