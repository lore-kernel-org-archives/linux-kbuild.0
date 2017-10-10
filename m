Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27464 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755826AbdJJAxs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 20:53:48 -0400
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VbRbvmqVK7iNG6xx3MD1vsCKRY=tW=K8Q71MoQkCFMOw@mail.gmail.com>
References: <20170926175508.29950-1-dianders@chromium.org> <20170926175508.29950-2-dianders@chromium.org>
 <CAK7LNASCy-zMNF1-7gie4NhyKC8xhAtyVHatpQ7JYLUz6UiG0w@mail.gmail.com>
 <CAD=FV=XQfLf+5ZPe4Vfqn1kpdom16YT7Nj=mw2Qydk1hmbL=pg@mail.gmail.com>
 <CAK7LNATdp47x3_gyi6pB+NLfoczECULPMkfx2N=eGOWm2DwqdQ@mail.gmail.com> <CAD=FV=VbRbvmqVK7iNG6xx3MD1vsCKRY=tW=K8Q71MoQkCFMOw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 10 Oct 2017 09:52:50 +0900
Message-ID: <CAK7LNAR0Gpk9U1gaCFn6CiOJUGr5jc+Pcz8vSP9GJRhchjWedQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Add a cache for generated variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

2017-10-06 5:58 GMT+09:00 Doug Anderson <dianders@chromium.org>:
> Hi,
>
> On Thu, Oct 5, 2017 at 12:26 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> As far as I tested, I always see only one space after ":=" in v2.
>>
>> I did not consider this deeply,
>> but something is working nicely behind the scene.
>
> Try adding this to the end of the main Makefile:
>
> +$(info LDFLAGS_BUILD_ID = $(LDFLAGS_BUILD_ID))
> +$(info KBUILD_ARFLAGS = $(KBUILD_ARFLAGS))
> +$(info KBUILD_CFLAGS = $(KBUILD_CFLAGS))
> +$(info KBUILD_AFLAGS = $(KBUILD_AFLAGS))
> +$(info KBUILD_CPPFLAGS = $(KBUILD_CPPFLAGS))
> +$(info REALMODE_CFLAGS = $(REALMODE_CFLAGS))
> +
>  endif  # skip-makefile
>
> Record what you see.  Then apply my patches and run your build again
> (actually, run it twice and look at the 2nd time, just to be sure).  I
> think you'll see slightly different spacing in the flags for the two
> runs.  I don't think this is terribly important, though.
>

Yes.  I see slight difference
in the resulted KBUILD_CFLAGS etc.

What I meant is:

In v2, I always see only one space after the assignment operator ":="
in .cache.mk
even without $(strip )


$(call cc-option,-fno-PIE)
$(call cc-option, -fno-PIE)
$(call cc-option,                   -fno-PIE)


All of the three gave me the same result.




-- 
Best Regards
Masahiro Yamada
