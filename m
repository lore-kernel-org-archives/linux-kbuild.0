Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:51375 "EHLO
        mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965039AbdIZRzp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Sep 2017 13:55:45 -0400
Received: by mail-pg0-f41.google.com with SMTP id k193so6318660pgc.8
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Sep 2017 10:55:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [RFC PATCH 0/2] kbuild: Cache exploratory calls to the compiler
Date: Tue, 26 Sep 2017 10:55:06 -0700
Message-Id: <20170926175508.29950-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: groeck@chromium.org, briannorris@chromium.org, Douglas Anderson <dianders@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

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

Please note that I make no illusions of being a Makefile expert nor do
I have any belief that I fully understand the Linux kernel build
system.  Please take this patch series as the start of a discussion
about whether others feel like this type of speedup is worthwhile and
how to best accomplish it.  Specific things to note:

- I'm happy to paint the bikeshed any color that maintainers want.  If
  you'd like the cache named differently, in a slightly different
  format, or you want me to adjust the spacing / names of Makefile
  stuff then please just let me know.

- If this is totally the wrong approach and you have a better idea
  then let me know.  If you want something that's super complicated to
  explain then feel free to post a replacement patch and I'm happy to
  test.

- This patch definitely needs extra testing.  I've tested it on a very
  limited build environment and it seems to be working fine, but I
  could believe that with some weird compiler options or on certain
  architectures you might need some extra escaping here and there.


Douglas Anderson (2):
  kbuild: Add a cache for generated variables
  kbuild: Cache a few more calls to the compiler

 Documentation/kbuild/makefiles.txt |  21 ++++++
 Makefile                           |   9 ++-
 scripts/Kbuild.include             | 133 +++++++++++++++++++++++++++++++------
 3 files changed, 142 insertions(+), 21 deletions(-)

-- 
2.14.1.821.g8fa685d3b7-goog

