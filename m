Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:43983 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752294AbeFYOVL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jun 2018 10:21:11 -0400
MIME-Version: 1.0
In-Reply-To: <20180625101607.08db48ff@gandalf.local.home>
References: <20180608214746.136554-1-gthelen@google.com> <CAK7LNARngmBXa5w3XFfuA7pEv39vWjJVNJ+3XVLPYd9QLH+f-A@mail.gmail.com>
 <20180625101607.08db48ff@gandalf.local.home>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 25 Jun 2018 23:20:26 +0900
Message-ID: <CAK7LNASiQztugmEGuTHmPg9vZY2b+btK+EzX-6o4NgCthHSpmg@mail.gmail.com>
Subject: Re: [PATCH] trace: fix SKIP_STACK_VALIDATION=1 build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Greg Thelen <gthelen@google.com>, Andi Kleen <andi@firstfloor.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Michal Marek <michal.lkml@markovi.net>

2018-06-25 23:16 GMT+09:00 Steven Rostedt <rostedt@goodmis.org>:
> On Sat, 23 Jun 2018 02:42:26 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> 2018-06-09 6:47 GMT+09:00 Greg Thelen <gthelen@google.com>:
>> > Non gcc-5 builds with CONFIG_STACK_VALIDATION=y and
>> > SKIP_STACK_VALIDATION=1 fail.
>> > Example output:
>> >   /bin/sh: init/.tmp_main.o: Permission denied
>> >
>> > commit 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace"),
>> > added a mismatched endif.  This causes cmd_objtool to get mistakenly
>> > set.
>> >
>> > Relocate endif to balance the newly added -record-mcount check.
>> >
>> > Fixes: 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace")
>> > Signed-off-by: Greg Thelen <gthelen@google.com>
>> > ---
>>
>> Applied to linux-kbuild/fixes. Thanks!
>>
>>
>
> I already pushed this to Linus. As I was the one to mess it up in the
> first place ;-) (I think I applied it with some fuzz)
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ed7d40bc67b8353c677b38c6cdddcdc310c0f452
>

OK.
I will drop this, then.

Thanks for the info.



> -- Steve
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
