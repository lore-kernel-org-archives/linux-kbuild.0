Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:49716 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753634AbdJPRNm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Oct 2017 13:13:42 -0400
Received: by mail-it0-f43.google.com with SMTP id y15so2110099ita.4
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Oct 2017 10:13:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 0/2] kbuild: Cache exploratory calls to the compiler
Date: Mon, 16 Oct 2017 10:12:44 -0700
Message-Id: <20171016171246.15712-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: groeck@chromium.org, sjg@chromium.org, briannorris@chromium.org, mingo@kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Josh Poimboeuf <jpoimboe@redhat.com>

This two-patch series attempts to speed incremental builds of the
kernel up by a bit.  How much of a speedup you get depends a lot on
your environment, specifically the speed of your workstation and how
fast it takes to invoke the compiler.

In the Chrome OS build environment you get a really big win.  For an
incremental build (via emerge) I measured a speedup from ~1 minute to
~35 seconds.  ...but Chrome OS calls the compiler through a number of
wrapper scripts and also calls the kernel make at least twice for an
emerge (during compile stage and install stage), so it's a bit of a
worst case.

Perhaps a more realistic measure of the speedup others might see is
running "time make help > /dev/null" outside of the Chrome OS build
environment on my system.  When I do this I see that it took more than
1.0 seconds before and less than 0.2 seconds after.  So presumably
this has the ability to shave ~0.8 seconds off an incremental build
for most folks out there.  While 0.8 seconds savings isn't huge, it
does make incremental builds feel a lot snappier.

Ingo Molnar also did some testing of this in his environment and found
that an incremental build of his subsystem sped up from ~.44 seconds
before to ~.15 seconds after.  Clean builds also sped up by a marginal
amount.  :)

Changes in v4:
- Add a mkdir
- Point to forward declaration commit by git hash

Changes in v3:
- Rule to prevent make from trying to generate the cache
- Rule to clean .cache.mk
- No more doc changes
- Moved cache stuff below cc-cross-prefix
- Removed duplicate documentation of try-run (oops)
- Add Tested-by for Ingo and Guenter since v2 and v3 are very similar

Changes in v2:
- Abstract at a different level (like shell-cached) per Masahiro Yamada
- Include ld-version, which I missed the first time

Douglas Anderson (2):
  kbuild: Add a cache for generated variables
  kbuild: Cache a few more calls to the compiler

 Makefile               |  5 +--
 scripts/Kbuild.include | 90 ++++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 79 insertions(+), 16 deletions(-)

-- 
2.15.0.rc0.271.g36b669edcc-goog

