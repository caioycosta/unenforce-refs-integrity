# unenforce-refs-integrity
A powershell script to turn Enforced Integrity Streams off on ReFS, thus preventing data loss.

If you want to know why, read this question on SuperUser:

https://superuser.com/questions/1502901/how-to-turn-refs-enforced-file-integrity-off

But it is not so simple, as the command can fail on really big directory tree:

https://superuser.com/questions/1561252/how-to-traverse-a-really-big-directory-tree-with-powershell

So I created this project based off the answer on SuperUser:

https://superuser.com/a/1561283/177447

With modifications for more reliable operation on special characters, long paths, etc.
