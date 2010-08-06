Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:63892 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935307Ab0HFCyK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Aug 2010 22:54:10 -0400
Message-ID: <4C5B7968.7070303@gmail.com>
Date: Thu, 05 Aug 2010 19:54:32 -0700
From: "Justin P. Mattock" <justinmattock@gmail.com>
MIME-Version: 1.0
Subject: Re: [GIT] kbuild: kconfig changes
References: <20100804125156.GA23464@sepie.suse.cz> <AANLkTi=hYsksUJUsrETjFouLDiKhwQHgD2oQ7XLyrOC-@mail.gmail.com> 	<4C5B64EA.2000804@gmail.com> <AANLkTikpsvpHuB-mWVfmqTRRMvbvhJz2LmoYBgtn4NQE@mail.gmail.com>
In-Reply-To: <AANLkTikpsvpHuB-mWVfmqTRRMvbvhJz2LmoYBgtn4NQE@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.cz>, JBeulich@novell.com, aris@redhat.com, catalin.marinas@arm.com, jacmet@sunsite.dk, lizf@cn.fujitsu.com, sam@ravnborg.org, ulfalizer.lkml@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/05/2010 07:08 PM, Linus Torvalds wrote:
> On Thu, Aug 5, 2010 at 6:27 PM, Justin P. Mattock
> <justinmattock@gmail.com>  wrote:
>>
>> With what I submitted I did not test make oldconfig, only make menuconfig
>> due to gcc 4.6.0 giving me a slew of warnings.
>>  From looking at make oldconfig I do see a more detailed explanation of what
>> each option is(last I remember it was more of a line with y/n)but then again
>> you could be seeing something completly different.
>
> Just test what I described:  do a "make oldconfig" (do it twice, if
> the first one needs to actually get some input). Do it on 2.6.35, and
> then on the current tree. Look at the _huge_ difference in output.
>

yeah I see what your hitting, just experienced what you posted

	make oldconfig
    scripts/kconfig/conf -o arch/x86/Kconfig
    #
    # configuration written to .config
    #

(just sits there)

seemed to not want to go away.(doing a make menuconfig got
make oldconfig to wake up of whatever it was in) as for reproducing
(even though already bisected) seems once make oldconfig starts working 
properly, hitting the above doesn't happen as easily.


>> Now if this is with what I submitted then I'll have a look at it and see if I can get this fixed.
>
> I just did a quick git bisect. It's introduced by commit 4062f1a4c030
> ("kconfig: use long options in conf") by Sam Ravnborg. Apparently that
> thing is totally buggy, and doesn't just change the option names, but
> actively breaks them.
>
>                   Linus
>

cool..

Justin P. Mattock
