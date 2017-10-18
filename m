Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22032 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751041AbdJRQt6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2017 12:49:58 -0400
MIME-Version: 1.0
In-Reply-To: <20171016171246.15712-1-dianders@chromium.org>
References: <20171016171246.15712-1-dianders@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Oct 2017 01:49:09 +0900
Message-ID: <CAK7LNARQ3nUcqRR2g+xwPpsSrOcNNz-YLH66ZSYnAsrXkUJLEg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] kbuild: Cache exploratory calls to the compiler
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, Simon Glass <sjg@chromium.org>, Brian Norris <briannorris@chromium.org>, Ingo Molnar <mingo@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Josh Poimboeuf <jpoimboe@redhat.com>

2017-10-17 2:12 GMT+09:00 Douglas Anderson <dianders@chromium.org>:
> This two-patch series attempts to speed incremental builds of the
> kernel up by a bit.  How much of a speedup you get depends a lot on
> your environment, specifically the speed of your workstation and how
> fast it takes to invoke the compiler.
>
> In the Chrome OS build environment you get a really big win.  For an
> incremental build (via emerge) I measured a speedup from ~1 minute to
> ~35 seconds.  ...but Chrome OS calls the compiler through a number of
> wrapper scripts and also calls the kernel make at least twice for an
> emerge (during compile stage and install stage), so it's a bit of a
> worst case.
>
> Perhaps a more realistic measure of the speedup others might see is
> running "time make help > /dev/null" outside of the Chrome OS build
> environment on my system.  When I do this I see that it took more than
> 1.0 seconds before and less than 0.2 seconds after.  So presumably
> this has the ability to shave ~0.8 seconds off an incremental build
> for most folks out there.  While 0.8 seconds savings isn't huge, it
> does make incremental builds feel a lot snappier.
>
> Ingo Molnar also did some testing of this in his environment and found
> that an incremental build of his subsystem sped up from ~.44 seconds
> before to ~.15 seconds after.  Clean builds also sped up by a marginal
> amount.  :)
>
> Changes in v4:
> - Add a mkdir
> - Point to forward declaration commit by git hash
>
> Changes in v3:
> - Rule to prevent make from trying to generate the cache
> - Rule to clean .cache.mk
> - No more doc changes
> - Moved cache stuff below cc-cross-prefix
> - Removed duplicate documentation of try-run (oops)
> - Add Tested-by for Ingo and Guenter since v2 and v3 are very similar
>
> Changes in v2:
> - Abstract at a different level (like shell-cached) per Masahiro Yamada
> - Include ld-version, which I missed the first time
>
> Douglas Anderson (2):
>   kbuild: Add a cache for generated variables
>   kbuild: Cache a few more calls to the compiler
>
>  Makefile               |  5 +--
>  scripts/Kbuild.include | 90 ++++++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 79 insertions(+), 16 deletions(-)
>


Applied to linux-kbuild/kbuild.  Thanks.

-- 
Best Regards
Masahiro Yamada
