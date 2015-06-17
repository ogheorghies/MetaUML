% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

%% Usage of skins
%%
%% Skins are configuration files that, in geneal, customize the settings of 
%% MetaUML *Info objects. You most likely want to include the skin file after 
%% all other MetaUML files have been included:
%%
%% input metauml
%% input metauml_skin_simple
%% 
%% % normal usage of MetaUML follows here
%%
%% More advanced skin files might customize fonts for specific elements 
%% (eg for Class and Note), and also colors (eg foreground, shade, line etc.)

if known _metauml_skin_simple_mp: 
  expandafter endinput 
fi;
_metauml_skin_simple_mp:=1;

iClass.foreColor := blue;
iClass.iName.iFont.name := "cmr12";
iClass.iAttributeStack.iPict.iFont.name := "cmr10";
iClass.iMethodStack.iPict.iFont.name := "cmr10";


