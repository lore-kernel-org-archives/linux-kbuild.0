Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f46.google.com ([74.125.83.46]:54797 "EHLO
        mail-pg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbdJCUtj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 16:49:39 -0400
Received: by mail-pg0-f46.google.com with SMTP id c137so5360375pga.11
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Oct 2017 13:49:39 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [RFC PATCH 0/2] build: Pass CC, CFLAGS, ... to tools build from main Makefile
Date: Tue,  3 Oct 2017 13:48:37 -0700
Message-Id: <20171003204839.27551-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, acme@redhat.com
Cc: groeck@chromium.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, mka@chromium.org, Douglas Anderson <dianders@chromium.org>, linux-kbuild@vger.kernel.org, David Carrillo-Cisneros <davidcc@google.com>, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>


While trying to enable CONFIG_STACK_VALIDATION in the Chrome OS build
system, Guenter Roeck noticed that the compilation of objtool was
failing in a weird way.  He tracked this down to the fact that,
although the kernel build ignores CFLAGS as of the ancient commit
69ee0b352242 ("kbuild: do not pick up CFLAGS from the environment"),
those the tools builds generally don't ignore CFLAGS.

For the most part it's OK that the tools builds don't ignore CFLAGS.
One could argue that the tools builds really _should_ honor CFLAGS
because, unlike the kernel, they don't need to be special snowflakes.
In general we're just building normal userspace programs and CFLAGS
from the environment can make sense.

...but... When a tools build is invoked from the kernel build then
CFLAGS probably won't make sense.  Specifically the kernel build
expects that "CC" is the _target_ compiler, not the _host_ compiler.
Presumably if CFLAGS is set in the current environment it will match
"CC".  That means it won't make a lot of sense to use when building
tools.

Technically we could just "fix" this by blanking out CFLAGS in the
call to the tools build, just like we've always done for LDFLAGS.
That would fix the problem that Guenter saw.  ...but we probably want
to go a step further.

In general it seems non-ideal that, even if someone overrides HOSTCC
in the kernel, that the tools build will still go back to a hardcoded
"gcc".  It seems like the compiler provided to the kernel as HOSTCC
really ought to be the compiler used in the tools build.  That seems
like it will be important for clang work.  The patches in this series
attempt to do that.

NOTE: I personally am not spending lots of time on clangification of
the kernel (though many of my colleagues are), so I haven't confirmed
that this is actually useful to clang.  It just seemed like a good
fix.  I also continue to assert that I'm not a kernel build expert, so
I've marked this as RFC in the hopes that people will not scream too
loudly if this is a stupid thing to do.  ;-)


Douglas Anderson (2):
  kbuild: Pass HOSTCC and similar to tools Makefiles
  tools build: Take CC, AS, and LD from the command line

 Makefile                       | 30 ++++++++++++++++++++++++++++--
 tools/scripts/Makefile.include | 22 ++++++++++++++++++++--
 2 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.14.2.920.gcf0c67979c-goog

