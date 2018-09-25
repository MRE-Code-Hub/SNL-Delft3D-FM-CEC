function fstrrep(file,orgtext,newtext)
%FSTRREP Replace string in file
%   FSTRREP(FileName,OrgText,NewText)
%   replace the OrgText by NewText in the specified file.
%
%   FSTRREP(FileName,'<version>','2.05.00')
%
%   See Also: STRREP

%----- LGPL --------------------------------------------------------------------
%
%   Copyright (C) 2011-2018 Stichting Deltares.
%
%   This library is free software; you can redistribute it and/or
%   modify it under the terms of the GNU Lesser General Public
%   License as published by the Free Software Foundation version 2.1.
%
%   This library is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%   Lesser General Public License for more details.
%
%   You should have received a copy of the GNU Lesser General Public
%   License along with this library; if not, see <http://www.gnu.org/licenses/>.
%
%   contact: delft3d.support@deltares.nl
%   Stichting Deltares
%   P.O. Box 177
%   2600 MH Delft, The Netherlands
%
%   All indications and logos of, and references to, "Delft3D" and "Deltares"
%   are registered trademarks of Stichting Deltares, and remain the property of
%   Stichting Deltares. All rights reserved.
%
%-------------------------------------------------------------------------------
%   http://www.deltaressystems.com
%   $HeadURL: https://svn.oss.deltares.nl/repos/delft3d/trunk/src/tools_lgpl/matlab/quickplot/fstrrep.m $
%   $Id: fstrrep.m 7992 2018-01-09 10:27:35Z mourits $

%
% Read the target file and replace the orgtext by the newtext.
%
fid=fopen(file,'r');
i=1;
str={};
while ~feof(fid)
    tmp=fgetl(fid);
    str{i}=strrep(tmp,orgtext,newtext);
    i=i+1;
end
fclose(fid);
%
% Write the updated file.
%
fid=fopen(file,'w');
fprintf(fid,'%s\n',str{:});
fclose(fid);