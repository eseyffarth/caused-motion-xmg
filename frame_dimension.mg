% COMPILE WITH: synframe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the frames for tokens that we list in the lemma lexicon.  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

type NAME = {John, Mary, Bill, Sylvia}
type MANNER = {dancing, singing, jumping, arguing, laughing}
type KIND = {fence, door, horse, stage}
type TRAJECTORY = {to, over, off}
type LABEL !

% Interface Features
feature i : LABEL
feature e : LABEL

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRAME HIERARCHY                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

frame-types = {activity, physical_object, person, name, manner, actor, mover, 
                translocation, landmark, trajectory, path, causation, kind}

frame-constraints = {
% Attribute constraints:
physical_object -> kind: +, % each physical object is of a particular kind
activity -> actor: +,       % each activity must have an ACTOR attribute
person ->  name: +          % each person must have a NAME attribute
}


%%%%%%%%%%
% Frames %
%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dance is an activity. You do it in a dancing manner.                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class FrameDummy

class FrameDance
  export ?X0
  declare ?X0
  {
      <frame>{
          ?X0[activity,
            manner: dancing]
      };
      <iface>{
        [e=?X0]
      }
  }

class FrameSing
export ?X0
 declare ?X0
 {
     <frame>{
         ?X0[activity,
         manner: singing]
     };
     <iface>{
       [e=?X0]
     }
 }

 class FrameLaugh
 export ?X0
  declare ?X0
  {
      <frame>{
          ?X0[activity,
          manner: laughing]
      };
      <iface>{
        [e=?X0]
      }
  }

 class FrameJump
 export ?X0
  declare ?X0
  {
      <frame>{
          ?X0[activity,
          manner: jumping]
      };
      <iface>{
        [e=?X0]
      }
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% John is a person. His name is John.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class FrameJohn
declare ?X0
{
  <frame>{
    ?X0[person,
      name: John]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameMary
declare ?X0
{
  <frame>{
    ?X0[person,
      name: Mary]
  };
  <iface>{
    [i=?X0]
  }
}


class FrameBill
declare ?X0
{
  <frame>{
    ?X0[person,
      name: Bill]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameSylvia
declare ?X0
{
  <frame>{
    ?X0[person,
      name: Sylvia]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameDoor
export ?X0
declare ?X0
{
  <frame>{
    ?X0[physical_object,
    kind: door]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameHorse
export ?X0
declare ?X0
{
  <frame>{
    ?X0[actor,
    kind: horse]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameFence
export ?X0
declare ?X0
{
  <frame>{
    ?X0[physical_object,
    kind: fence]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameStage
export ?X0
declare ?X0
{
  <frame>{
    ?X0[physical_object,
    kind: stage]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameOver
export ?X0
declare ?X0
{
  <frame>{
    ?X0[path,
    trajectory: over]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameTo
export ?X0
declare ?X0
{
  <frame>{
    ?X0[path,
    trajectory: to]
  };
  <iface>{
    [i=?X0]
  }
}


class FrameOff
export ?X0
declare ?X0
{
  <frame>{
    ?X0[path,
    trajectory: off]
  };
  <iface>{
    [i=?X0]
  }
}

value FrameDance
value FrameSing
value FrameJump
value FrameLaugh
% value FrameArgue
value FrameJohn
value FrameMary
value FrameBill
value FrameSylvia
value FrameDoor
value FrameHorse
value FrameFence

value FrameStage

value FrameOver
value FrameTo
value FrameOff

value FrameDummy