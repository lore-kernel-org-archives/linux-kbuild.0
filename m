Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8973 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751749AbaJTOmX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Oct 2014 10:42:23 -0400
Message-id: <54451F4B.8020900@samsung.com>
Date: Mon, 20 Oct 2014 18:42:19 +0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: drivers: random: Shift out-of-bounds in _mix_pool_bytes
References: <1413802499-17928-1-git-send-email-a.ryabinin@samsung.com>
 <5444EBFA.5030103@samsung.com> <20141020124929.GA23177@thunk.org>
 <54451501.2070700@samsung.com> <5445179A.4080804@redhat.com>
 <20141020141635.GA4499@thunk.org>
In-reply-to: <20141020141635.GA4499@thunk.org>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Daniel Borkmann <dborkman@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michal Marek <mmarek@suse.cz>, Sasha Levin <sasha.levin@oracle.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>

On 10/20/2014 06:16 PM, Theodore Ts'o wrote:
> On Mon, Oct 20, 2014 at 04:09:30PM +0200, Daniel Borkmann wrote:
>>>
>>> It's triggering when input_rotate == 0, so UBSan complains about right shift in rol32()
>>>
>>> static inline __u32 rol32(__u32 word, unsigned int shift)
>>> {
>>> 	return (word << shift) | (word >> (32 - shift));
>>> }
>>
>> So that would be the case when the entropy store's input_rotate calls
>> _mix_pool_bytes() for the very first time ... I don't think it's an
>> issue though.
> 
> I'm sure it's not an issue, but it's still true that 
> 
> 	return (word << 0) | (word >> 32);
> 
> is technically not undefined, and while it would be unfortunate (and
> highly unlikely) if gcc were to say, start nethack, it's technically
> allowed by the C spec.  :-)
> 

There are plenty of such technically not defined but really
harmless things in kernel.
I've reported only few UBs which seemed to me like a real bugs.
So if it's not an issue we could ignore it, OTOH it would be nice
to fix it to shut up ubsan.

>      	     	   	    	 	     - Ted
> 

