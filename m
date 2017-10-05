Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:43577 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751695AbdJEU6t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 16:58:49 -0400
Received: by mail-wm0-f47.google.com with SMTP id m72so642906wmc.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Oct 2017 13:58:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATdp47x3_gyi6pB+NLfoczECULPMkfx2N=eGOWm2DwqdQ@mail.gmail.com>
References: <20170926175508.29950-1-dianders@chromium.org> <20170926175508.29950-2-dianders@chromium.org>
 <CAK7LNASCy-zMNF1-7gie4NhyKC8xhAtyVHatpQ7JYLUz6UiG0w@mail.gmail.com>
 <CAD=FV=XQfLf+5ZPe4Vfqn1kpdom16YT7Nj=mw2Qydk1hmbL=pg@mail.gmail.com> <CAK7LNATdp47x3_gyi6pB+NLfoczECULPMkfx2N=eGOWm2DwqdQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Oct 2017 13:58:47 -0700
Message-ID: <CAD=FV=VbRbvmqVK7iNG6xx3MD1vsCKRY=tW=K8Q71MoQkCFMOw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Add a cache for generated variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

Hi,

On Thu, Oct 5, 2017 at 12:26 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> As far as I tested, I always see only one space after ":=" in v2.
>
> I did not consider this deeply,
> but something is working nicely behind the scene.

Try adding this to the end of the main Makefile:

+$(info LDFLAGS_BUILD_ID = $(LDFLAGS_BUILD_ID))
+$(info KBUILD_ARFLAGS = $(KBUILD_ARFLAGS))
+$(info KBUILD_CFLAGS = $(KBUILD_CFLAGS))
+$(info KBUILD_AFLAGS = $(KBUILD_AFLAGS))
+$(info KBUILD_CPPFLAGS = $(KBUILD_CPPFLAGS))
+$(info REALMODE_CFLAGS = $(REALMODE_CFLAGS))
+
 endif  # skip-makefile

Record what you see.  Then apply my patches and run your build again
(actually, run it twice and look at the 2nd time, just to be sure).  I
think you'll see slightly different spacing in the flags for the two
runs.  I don't think this is terribly important, though.

-Doug
