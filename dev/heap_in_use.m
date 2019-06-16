% This will continuously plot HeapInUse for a process named "bitumdata". The bitumps
% binary is required. Install it with "go get github.com/bitumlabs/bitumps".

% Try to get the GOPATH environment variable, but if it is not available
% Octave/MATLAB, it may be necessary setenv('GOPATH','/path/to/gopath') before
% calling this script, or to define the bitumps math manually here.
bitumps = [fullfile(getenv('GOPATH'), '/bin/bitumps')];
%bitumps = '/path/to/bitumps';
printf('Using bitumps at \"%s\"\n', bitumps)
heapuse = [];
h = figure;
ax = axes('parent',h);
while true,
  [s,out] = system([bitumps  ' memstats bitumdata | grep heap-in-use | awk ''{print $3}'' | sed ''s/(//''']);
  heapuse(end+1) = str2double(out);
  plot(ax, heapuse, 'linewidth', 2); drawnow
  pause(0.05)
end
