var spawn = require('child_process').spawn,
ls    = spawn('cmd.exe', ['/c', 'batchprinter.bat']);

ls.stdout.on('data', function (data) {
console.log('stdout: ' + data);
});

ls.stderr.on('data', function (data) {
console.log('stderr: ' + data);
console.log("Error");
});

ls.on('exit', function (code) {
console.log('child process exited with code ' + code);
});