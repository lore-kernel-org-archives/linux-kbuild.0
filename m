Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:60881 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751489AbaJTOIr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Oct 2014 10:08:47 -0400
Date: Mon, 20 Oct 2014 10:08:18 -0400
From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: drivers: random: Shift out-of-bounds in _mix_pool_bytes
Message-ID: <20141020140818.GB23177@thunk.org>
References: <1413802499-17928-1-git-send-email-a.ryabinin@samsung.com>
 <5444EBFA.5030103@samsung.com>
 <20141020124929.GA23177@thunk.org>
 <54451501.2070700@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54451501.2070700@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michal Marek <mmarek@suse.cz>, Sasha Levin <sasha.levin@oracle.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>

On Mon, Oct 20, 2014 at 05:58:25PM +0400, Andrey Ryabinin wrote:
> It's triggering when input_rotate == 0, so UBSan complains about right shift in rol32()
> 
> static inline __u32 rol32(__u32 word, unsigned int shift)
> {
> 	return (word << shift) | (word >> (32 - shift));
> }

Ah, thanks; I don't know why I didn't see that.

So the only real question is whether we fix it in the call to rol32,
or in the rol32 function itself (i.e):

static inline __u32 rol32(__u32 word, unsigned int shift)
{
	return shift ? ((word << shift) | (word >> (32 - shift))) : word;
}

Dos that make sense to everyone?

						- Ted
