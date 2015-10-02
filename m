Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41367 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751080AbbJBB0g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Oct 2015 21:26:36 -0400
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] modpost: Add flag -f for making section mismatches fatal
In-Reply-To: <1443746068-33050-1-git-send-email-drinkcat@chromium.org>
References: <1443746068-33050-1-git-send-email-drinkcat@chromium.org>
Date: Fri, 02 Oct 2015 10:56:23 +0930
Message-ID: <87a8s2njr4.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>, linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Pranith Kumar <bobby.prani@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Davidlohr Bueso <dave@stgolabs.net>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, John Stultz <john.stultz@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, Quentin Casasnovas <quentin.casasnovas@oracle.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Chris Metcalf <cmetcalf@ezchip.com>, Takashi Iwai <tiwai@suse.de>, Kyle McMartin <kyle@redhat.com>, linux-kernel@vger.kernel.org, Jonathan Kliegman <kliegs@chromium.org>, olofj@chromium.org, Sam Ravnborg <sam@ravnborg.org>

Nicolas Boichat <drinkcat@chromium.org> writes:
> The section mismatch warning can be easy to miss during the kernel build
> process. Allow it to be marked as fatal to be easily caught and prevent
> bugs from slipping in.
>
> Setting CONFIG_SECTION_MISMATCH_WARNING=y causes these warnings to be
> non-fatal, since there are a number of section mismatches when using
> allmodconfig on some architectures, and we do not want to break these
> builds by default.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> Change-Id: Ic346706e3297c9f0d790e3552aa94e5cff9897a6
> ---
>
> I'm trying to revive this old patch. When it was first submitted [1],
> Jonathan got the following feedback:
>  - The logic of the option should be inverted (i.e. SECTION_MISMATCH_WARNING),
>    so that is not not enabled in allmodconfig for some architectures that do
>    have section mismatches. I've seen some failures (namely, on arm64), so I
>    did that.
>  - CONFIG_DEBUG_SECTION_MISMATCH should be removed and warnings should always
>    be shown verbosely. This option does 3 things:
>      1. Enable -fno-inline-functions-called-onc
>      2. Run the section mismatch analysis for each module/built-in.o
>      3. Enable verbose reporting from modpost
>    We definitely do not want 1 by default, so I think we should keep the option.
>    If we enable 2 & 3 by default, which I think would be reasonable, then the
>    option name does not make much sense anymore, and I'm not sure what to do
>    with the documentation that is currently provided in the Kconfig description.
>
> Tested on x86-64 allmodconfig, setting the option to =n, and creating a
> section mismatch by running:
> sed -i -e 's/\(ssize_t soc_codec_reg_show\)/__init \1/' sound/soc/soc-core.c

Minor feedback:

1) Please rename to CONFIG_SECTION_MISMATCH_WARN_ONLY.
2) -f means force, perhaps -E for error?

Otherwise, quite nice.

Thanks,
Rusty.
