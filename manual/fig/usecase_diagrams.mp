% Part of the MetaUML manual.
% Copyright (C) 2005 Ovidiu Gheorghies
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

% for f in `find . | grep '.*\.[1-9]'`; do echo $f; done

input metauml;

beginfig(1);
  Actor.user("User");
  Actor.db("Database");

  Usecase.dbquery("Query database");
  Usecase.auth("Authentification");
  Usecase.authA("Authentification by", "username, password");
  Usecase.authB("Authentification by", "smartcard");

  auth.w = user.human.e + (30,0);
  dbquery.s = auth.n + (0,30);
  db.human.w = dbquery.e + (30,0);

  authB.left - authA.right = 30;
  authB.midy = authA.midy;
  .5[authB.w, authA.e] = (auth.midx, auth.bottom - 50);
  
  drawObjects(user, auth, dbquery, db, authA, authB);

  clink(inheritance)(authA, auth);
  clink(inheritance)(authB, auth);
  clink(association)(auth, dbquery);
  clink(association)(user.human, auth);
  clink(association)(dbquery, db.human);
endfig;

end
