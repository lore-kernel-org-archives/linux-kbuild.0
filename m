Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34932 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751291AbdJEHws (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 03:52:48 -0400
Date: Thu, 5 Oct 2017 09:52:43 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 0/2] kbuild: Cache exploratory calls to the compiler
Message-ID: <20171005075243.zchjpo7qd7ueff4h@gmail.com>
References: <20171004223717.3010-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171004223717.3010-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, groeck@chromium.org, sjg@chromium.org, briannorris@chromium.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Josh Poimboeuf <jpoimboe@redhat.com>


* Douglas Anderson <dianders@chromium.org> wrote:

> This two-patch series attempts to speed incremental builds of the
> kernel up by a bit.  How much of a speedup you get depends a lot on
> your environment, specifically the speed of your workstation and how
> fast it takes to invoke the compiler.
> 
> In the Chrome OS build environment you get a really big win.  For an
> incremental build (via emerge) I measured a speedup from ~1 minute to
> ~35 seconds.

Very impressive!

> [...]  ...but Chrome OS calls the compiler through a number of wrapper scripts 
> and also calls the kernel make at least twice for an emerge (during compile 
> stage and install stage), so it's a bit of a worst case.

I don't think that's a worst case: incremental builds are very commonly used 
during kernel development and kernel testing. (I'd even argue that the performnace 
of incremental builds is one of the most important features of a build system.)

That it's called twice in the Chrome OS build system does not change the 
proportion of the speedup.

> Perhaps a more realistic measure of the speedup others might see is
> running "time make help > /dev/null" outside of the Chrome OS build
> environment on my system.  When I do this I see that it took more than
> 1.0 seconds before and less than 0.2 seconds after.  So presumably
> this has the ability to shave ~0.8 seconds off an incremental build
> for most folks out there.  While 0.8 seconds savings isn't huge, it
> does make incremental builds feel a lot snappier.

This is a huge deal!

FWIIW I have tested your patches and they work fine here. Here's the before/after 
performance testing of various styles of build times of the scheduler.

First the true worst case is a full rebuild:

[ before ]

  triton:~/tip> perf stat --null --repeat 3 --pre "make clean 2>/dev/null 2>&1" make kernel/sched/ >/dev/null

 Performance counter stats for 'make kernel/sched/' (3 runs):

       4.693974827 seconds time elapsed                                          ( +-  0.05% )

[ after ]

  triton:~/tip> perf stat --null --repeat 3 --pre "make clean 2>/dev/null 2>&1" make kernel/sched/ >/dev/null

 Performance counter stats for 'make kernel/sched/' (3 runs):

       4.391769610 seconds time elapsed                                          ( +-  0.21% )

Still a ~6% speedup which is nice to have.

Then the best case, a fully cached rebuild of a specific subsystem - which I 
personally do all the time when I don't remember whether I already built the 
kernel or not:

[ before ]

triton:~/tip> taskset 1 perf stat --null --pre "sync" --repeat 10 make kernel/sched/ >/dev/null

 Performance counter stats for 'make kernel/sched/' (10 runs):

       0.439517157 seconds time elapsed                                          ( +-  0.14% )

[ after ]

  triton:~/tip> taskset 1 perf stat --null --pre "sync" --repeat 10 make kernel/sched/ >/dev/null

 Performance counter stats for 'make kernel/sched/' (10 runs):

       0.148483807 seconds time elapsed                                          ( +-  0.57% )

A 300% speedup on my system!

So I wholeheartedly endorse the whole concept of caching build environment 
invariants:

  Tested-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
