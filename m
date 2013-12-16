Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:40592 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750863Ab3LPXsr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Dec 2013 18:48:47 -0500
From: Ross Zwisler <ross.zwisler@linux.intel.com>
Subject: [PATCH] oops_trace.vim: initial version
Date: Mon, 16 Dec 2013 16:48:31 -0700
Message-Id: <1387237712-11846-1-git-send-email-ross.zwisler@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ross Zwisler <ross.zwisler@linux.intel.com>

This commit adds a VIM script, oops_trace.vim, which allows you to quickly
jump to the source code lines associated with symbol+offset lines in Oops
style call traces:

Call Trace:
[<ffffffffa08846b2>] ext4_wait_block_bitmap+0x82/0xf0 [ext4]
[<ffffffffa088517a>] ext4_read_block_bitmap+0x3a/0x60 [ext4]
[<ffffffffa0885280>] ext4_count_free_clusters+0xe0/0x1c0 [ext4]
[<ffffffffa08adc24>] ext4_fill_super+0x15b4/0x2ff0 [ext4]
[<ffffffff8126da79>] ? vsnprintf+0x309/0x5f0
[<ffffffff8118e9d8>] ? iput+0x48/0x190
[<ffffffff811768d8>] mount_bdev+0x1b8/0x200
[<ffffffffa08ac670>] ? ext4_calculate_overhead+0x3d0/0x3d0 [ext4]
...

Stick the VIM script in your ~/.vim/plugin directory, compile with kernel
debug symbols, and then you can use the normal ctag-style symbol lookup
keystroke (control-]) to jump to the source line associated with the stack
trace.  And, just as with normal tags, you can pop from the tag stack using
the normal keystroke (control-t).

This script works with symbols compiled directly into the kernel as well as
with symbols in kernel modules.

Signed-off-by: Ross Zwisler <ross.zwisler@linux.intel.com>
---
 scripts/oops_trace.vim |  108 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 scripts/oops_trace.vim

diff --git a/scripts/oops_trace.vim b/scripts/oops_trace.vim
new file mode 100644
index 0000000..0456e6a
--- /dev/null
+++ b/scripts/oops_trace.vim
@@ -0,0 +1,108 @@
+" oops_trace.vim - Use tag-style lookups on Linux kernel oops backtraces.
+"
+" Maintainer:   Ross Zwisler <ross.zwislerNOSPAM@linux.intel.com>
+"
+" This script lets you use tag-style lookups (i.e. C-] ) on Linux kernel oops
+" stack traces.  For this to work, you need the following:
+"
+" 1) The log file with the stack trace needs to be recognized as having
+"    filetype=messages, which is hopefully the default.  If not, run 
+"    'set filetype=messages'.
+" 2) You need to have built your kernel with debug symbols
+"    (CONFIG_DEBUG_INFO=y).
+" 3) Vim needs to have its PWD in your Linux build directory, or you need to
+"    set up the g:oops_path global variable to your build directory.  i.e.:
+"    let g:oops_path='/home/myuser/linux-kernel'
+
+function! s:FakeTagJump(file, line)
+        let file=a:file
+        let tmpfile = tempname()
+        let tag=substitute(tmpfile, '/','', 'g')
+        let tagline = tag . "\t".fnamemodify(file, ":p")."\t".a:line
+        call writefile([tagline], tmpfile)
+        exe "set tags+=" . tmpfile
+        exe "tag " . tag
+        call system("rm " . tmpfile)
+        exe "set tags-=" . tmpfile  
+endfun
+
+function! s:GotoLine(file)
+	if (filereadable(a:file))
+            return
+	endif
+
+	let names =  matchlist( a:file, '\([^:]\+\):\(\d\+\)')
+
+	if empty(names)
+            return
+	endif
+
+	let file_name = names[1]
+	let line_num  = names[2] == ''? '0' : names[2]
+
+	if filereadable(file_name)
+            call s:FakeTagJump(file_name, line_num)
+            exec "normal! zz"
+	endif
+endfunction
+
+function! OopsTrace(line)
+    let symbols = matchlist(a:line, '\(\(\w\|\.\)\+\)+\(\w\+\)/\w\+\( \[\(\w\+\)\]\)\?')
+
+    if empty(symbols)
+        return
+    endif
+
+    let function = symbols[1]
+    let offset   = symbols[3]
+    let module   = symbols[5]
+
+    if exists("g:oops_path")
+        let oops_path = g:oops_path
+    else
+        let oops_path = getcwd()
+    endif
+
+    if !filereadable(oops_path . '/vmlinux')
+        echo "Can't find Linux build files - please check " . oops_path
+        return
+    endif
+
+    if module == ''
+        let module = oops_path . "/vmlinux"
+    else
+        let module = system("find " . oops_path . " -name " . module . ".ko")
+        if module == ""
+            echo "Kernel module not found"
+            return
+        endif
+        let module = substitute(module, '\n$', '', '')
+    endif
+
+    if offset != 0
+        " this is necssary so we return to the caller, not the next
+        " instruction to be executed after return
+        let offset = offset - 1
+    endif
+
+    let func_offset_cmd = "nm ". module . '| awk "/ [Tt] ' . function . '\$/ { print \"0x\" \$1; }" | head -n1'
+    let func_offset = system(func_offset_cmd)
+
+    if func_offset == ""
+        echo "Symbol lookup failed"
+        return
+    endif
+
+    let abs_offset = system("printf 0x%x " . (func_offset + offset))
+
+    let location = system('addr2line -e ' . module . ' ' . abs_offset)
+    let location = substitute(location, '\n$', '', '')
+
+    if location == '??:?'
+        echo "Was your kernel built with debug symbols?"
+    else
+        call s:GotoLine(location)
+    endif
+endfunction
+
+au filetype messages nnoremap <buffer> <silent> <C-]> :call OopsTrace(getline(line('.')))<CR>
-- 
1.7.10.4

