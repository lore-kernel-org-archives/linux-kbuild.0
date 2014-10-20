Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:46930 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752345AbaJTN6a (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Oct 2014 09:58:30 -0400
Message-id: <54451501.2070700@samsung.com>
Date: Mon, 20 Oct 2014 17:58:25 +0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: drivers: random: Shift out-of-bounds in _mix_pool_bytes
References: <1413802499-17928-1-git-send-email-a.ryabinin@samsung.com>
 <5444EBFA.5030103@samsung.com> <20141020124929.GA23177@thunk.org>
In-reply-to: <20141020124929.GA23177@thunk.org>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michal Marek <mmarek@suse.cz>, Sasha Levin <sasha.levin@oracle.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>

On 10/20/2014 04:49 PM, Theodore Ts'o wrote:
> On Mon, Oct 20, 2014 at 03:03:22PM +0400, Andrey Ryabinin wrote:
>> Hi, Theodore.
>>
>> I've got this while booting kernel with ubsan:
>>
>>     [    0.000000] ================================================================================
>>     [    0.000000] UBSan: Undefined behaviour in ../include/linux/bitops.h:107:33
>>     [    0.000000] shift exponent 32 is to large for 32-bit type 'unsigned int'
>       ...
>>     [    0.000000] _mix_pool_bytes (/home/andrew/linux/ubsan_x86//include/linux/bitopsh:107 /home/andrew/linux/ubsan_x86//drivers/char/randomc:509)
> 
> So this doesn't make any sense to me.   This is triggering here:
> 
> 	w = rol32(*bytes++, input_rotate);
> 
> .... but input_rotate should never be >= 32, since it is set this way:
> 

It's triggering when input_rotate == 0, so UBSan complains about right shift in rol32()

static inline __u32 rol32(__u32 word, unsigned int shift)
{
	return (word << shift) | (word >> (32 - shift));
}


> 	input_rotate = (input_rotate + (i ? 7 : 14)) & 31;
> 
> Just to be sure I've tried adding a:
> 
> 	WARN_ON(input_rotate >= 32);
> 
> before the rol32 line, and it's not triggering for me after booting
> under kvm using an i386 kernel.
> 
> Is this something you can reliably reproduce?  Can you try putting a
> WARN_ON before the rol32() on a kernel w/o usbsan, just to make sure
> this isn't some kind of false positive?  And then can you tell me
> something more about the .config you are using to build your test kernel?
> 
> Thanks,
> 
> 						- Ted
> 

