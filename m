Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:56318 "EHLO
        mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751182AbdJDWiQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 18:38:16 -0400
Received: by mail-pf0-f177.google.com with SMTP id g62so1383670pfk.12
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Oct 2017 15:38:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/2] kbuild: Cache exploratory calls to the compiler
Date: Wed,  4 Oct 2017 15:37:15 -0700
Message-Id: <20171004223717.3010-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: groeck@chromium.org, sjg@chromium.org, briannorris@chromium.org, Douglas Anderson <dianders@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

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

Caveats from v1 still copied here, though with Masahiro Yamada's
suggestions from v1 this is starting to feel a little more baked and
I've even dropped the RFC from it (though extra testing still
appreciated):

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

Changes in v2:
- Abstract at a different level (like shell-cached) per Masahiro Yamada
- Include ld-version, which I missed the first time

Douglas Anderson (2):
  kbuild: Add a cache for generated variables
  kbuild: Cache a few more calls to the compiler

 Documentation/kbuild/makefiles.txt | 21 +++++++++
 Makefile                           |  4 +-
 scripts/Kbuild.include             | 90 ++++++++++++++++++++++++++++++++------
 3 files changed, 99 insertions(+), 16 deletions(-)

-- 
2.14.2.920.gcf0c67979c-goog

