Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from LGEMRELSE7Q.lge.com ([156.147.1.151]:49965 "EHLO
	LGEMRELSE7Q.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755703Ab3BAIPH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Feb 2013 03:15:07 -0500
Message-ID: <510B7984.3060509@lge.com>
Date: Fri, 01 Feb 2013 17:15:00 +0900
From: "kyungsik.lee" <kyungsik.lee@lge.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 0/4] Add support for LZ4-compressed kernels
References: <1359179447-31118-1-git-send-email-kyungsik.lee@lge.com> <20130128142510.68092e10.akpm@linux-foundation.org> <20130129101549.GP23505@n2100.arm.linux.org.uk> <34874167.ghObrToI03@fb07-iapwap2>
In-Reply-To: <34874167.ghObrToI03@fb07-iapwap2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Egon Alter <egon.alter@gmx.net>
Cc: linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, hyojun.im@lge.com, raphael.andy.lee@gmail.com, linux-kbuild@vger.kernel.org, gunho.lee@lge.com, namhyung.kim@lge.com, x86@kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nitin Gupta <nitingupta910@gmail.com>, Richard Purdie <rpurdie@openedhand.com>, Ingo Molnar <mingo@redhat.com>, Joe Millenbach <jmillenbach@gmail.com>, chan.jeong@lge.com, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, CE Linux Developers List <celinux-dev@lists.celinuxforum.org>, minchan.kim@lge.com

On 2013-01-29 오후 8:43, Egon Alter wrote:
> Am Dienstag, 29. Januar 2013, 10:15:49 schrieb Russell King - ARM Linux:
>> On Mon, Jan 28, 2013 at 02:25:10PM -0800, Andrew Morton wrote:
>>> What's this "with enabled unaligned memory access" thing?  You mean "if
>>> the arch supports CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS"?  If so,
>>> that's only x86, which isn't really in the target market for this
>>> patch, yes?
>>>
>>> It's a lot of code for a 50ms boot-time improvement.  Does anyone have
>>> any opinions on whether or not the benefits are worth the cost?
>> Well... when I saw this my immediate reaction was "oh no, yet another
>> decompressor for the kernel".  We have five of these things already.
>> Do we really need a sixth?
>>
>> My feeling is that we should have:
>> - one decompressor which is the fastest
>> - one decompressor for the highest compression ratio
>> - one popular decompressor (eg conventional gzip)
> the problem gets more complicated as the "fastest" decompressor usually
> creates larger images which need more time to load from the storage, e.g. a
> one MB larger image on a 10 MB/s storage (note: bootloaders often configure
> the  storage controllers in slow modes) gives 100 ms more boot time, thus
> eating the gain of a "fast decompressor".
Yes, the larger image could matter. Definitely it takes longer.

Here are some updated test cases: Including "loading time"

                                 lzo           lz4
loading time:             480ms       510ms
decompression time: 336ms       180ms(with efficient unaligned memory 
access enabled and ARM optimization)
total time:                 816ms        690ms

lz4 is still 15% faster in total time. This one is similar to the 
simulated result by Russell King.

Thanks,
Kyungsik
