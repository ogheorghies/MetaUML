% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

%%% if known _util_log_mp:
%%%   expandafter endinput
%%% fi;
_util_log_mp:=1;

util_loglevel_PARANOIA:=1;
util_loglevel_DEBUG:=2;
util_loglevel_RELEASE:=3;
util_loglevel_SILENT:=4;

util_log_thresholdlevel := util_loglevel_DEBUG;
util_log_defaultlevel   := util_loglevel_RELEASE;

def elog(expr loglevel) text txt=
  if (loglevel <= util_log_thresholdlevel):
    %includeonce% show txt
  else:
    % do nothing
  fi;
enddef;

def log text txt=
  if (util_log_defaultlevel <= util_log_thresholdlevel):
    show txt
  else:
    % do nothing
  fi;
enddef;
