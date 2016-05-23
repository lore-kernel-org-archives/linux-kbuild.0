Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35333 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124AbcEWXC2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2016 19:02:28 -0400
Received: by mail-wm0-f67.google.com with SMTP id f75so847988wmf.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2016 16:02:28 -0700 (PDT)
From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: Automatic dependency resolution on generated python file
Message-ID: <57438C01.6090601@bingham.xyz>
Date: Tue, 24 May 2016 00:02:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: Jan Kiszka <jan.kiszka@web.de>

Hi Kbuild / Michal,

I've been working through a problem that Jan has reported whereby if we
modify a file included by our template  for constants.py, the generated
file is not rebuilt.

The rule/cmd [0] to generate the python constants is
cmd_gen_constants_py which uses the $(CPP) with $(c_flags) to create the
output.

One benefit of this is that it already creates the $(depfile) through
the addition of the flags provided by $(c_flags), however as yet it
would seem that my efforts to understand how the $(depfile) gets
included have failed.

From what I can tell, the $(call if_changed...) rule is generating my
targets .constants.py.cmd, but the .d file is not being utilised.

By swapping $(call if_changed, ) to $(call if_changed_dep,...) I can see
that my .constants.py.cmd [1] file now has (apparently) correct
dependency rules being generated. However they still don't take actual
effect. If I 'touch/modify' one of the files I have added to the
#includes, then my target is not rebuilt (I have added
include/linux/kieran.h for testing this specifically without rebuilding
all other objects)

I can see at the bottom of my .constants.py.cmd :
  scripts/gdb/linux/constants.py: $(deps_scripts/gdb/linux/constants.py)
  $(deps_scripts/gdb/linux/constants.py):

which looks like it's doing the right thing to me ... except it's not
actually allowing the rule to run if a dependency is updated.

Is this failing because it is being called from the top Kbuild, as part
of making sure it is built after bounds.h, or is it because I'm not
generating from the builtin rules?

I'm hoping perhaps I've missed a stage or something obvious that will
make this automatic dependency resolution 'just-work' for recreating the
constants file.

-- 
Regards

Kieran Bingham


[0]
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/scripts/gdb/linux/Makefile

[1] http://paste.ubuntu.com/16645481/

