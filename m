Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:61678 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752899Ab0EULHi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 May 2010 07:07:38 -0400
MIME-Version: 1.0
In-Reply-To: <AANLkTik4gyHBrCAfnVogj-DiEHkp3b1OlSYcja1pJ83R@mail.gmail.com>
References: <AANLkTil73ArhX2w6b_v1bmWjP1FA5zUTfPzK2N4waOu1@mail.gmail.com>
	 <AANLkTik0IjrVr-Cey0wumA5DpL5XutUwEtnp_1w2OQEY@mail.gmail.com>
	 <AANLkTik4gyHBrCAfnVogj-DiEHkp3b1OlSYcja1pJ83R@mail.gmail.com>
Date: Fri, 21 May 2010 14:07:06 +0300
Message-ID: <AANLkTikBzDJwcMXYq_c3Tp1yLi4XKdWTzFd0ezW81cYI@mail.gmail.com>
Subject: Re: [ANNOUNCE] GSoC project: Improving kconfig using a SAT solver
From: Felipe Contreras <felipe.contreras@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Bart Massey <bart@cs.pdx.edu>, Michal Marek <mmarek@suse.cz>, Greg Kroah-Hartman <greg@kroah.com>, Ingo Molnar <mingo@elte.hu>, James Bottomley <James.Bottomley@hansenpartnership.com>

On Wed, May 19, 2010 at 9:31 PM, Vegard Nossum <vegard.nossum@gmail.com> wrote:
> On 19 May 2010 13:05, Felipe Contreras <felipe.contreras@gmail.com> wrote:
>> Does this means that if you have a pristine kernel, and you do 'make
>> menuconfig' and don't change anything, the .config file will be empty?
>> And then, anything that you change will be in the .config file?
>
> Yes and no -- I think the plan is to retain the .config file as it is
> (i.e. it specifies more or less every option completely), so that it
> remains backwards compatible; bisection, for example, is very
> important. But yes, I think there will be a new file, say, .satconfig,
> which contains only the specific choices of the user. And this one
> would be empty, as you say, with a pristine kernel.
>
> I think, then, that the .config file will be regenerated from the
> .satconfig one each time .satconfig changes.

I see. As long as people can use .satconfig only if they want, I think
that's great.

>> On another case I do 'make ARCH=arm omap3_beagle_defconfig' then my
>> .config file will point to that particular defconfig, and I can add
>> only the changes that I want. Also, omap3_beagle_defconfig probably
>> points omap3_defconfig and only makes certain changes.
>>
>> If so, that would be awesome :)
>
> Do you mean essentially a sort of cascade of configurations that
> inherit options from a different file? That shouldn't be very hard to
> do -- I'll make a note of it for when I get that far! That has the
> potential to make the defconfig files a bit shorter and more
> manageable (not sure how big a problem that is in practice today,
> though).

Exactly. Well, I don't know if anybody considers that a problem, but
just check arch/arm/configs/*. All of them are much bigger than
needed, and some have not been updated in a long time (even as old as
2.6.11). So if you do make ARCH=arm assabet_defconfig and do a 'diff
.config assabet_defconfig' they would be completely different. This
way it's hard to keep track of the general config changes, and ARM
related changes, and OMAP3 changes, and compare with board-specific
ones.

Cheers.

-- 
Felipe Contreras
