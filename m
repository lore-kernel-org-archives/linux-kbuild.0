Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from s15228384.onlinehome-server.info ([87.106.30.177]:53296 "EHLO
	mail.x86-64.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752264Ab0BWRyr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2010 12:54:47 -0500
Date: Tue, 23 Feb 2010 18:54:57 +0100
From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH] x86: Add optimized popcnt variants
Message-ID: <20100223175457.GA2401@aftab>
References: <20100219142205.GA32533@aftab>
 <4B7EB6EF.9010405@zytor.com>
 <20100219164512.GA492@aftab>
 <4B7EC20C.30607@zytor.com>
 <20100222141737.GB21233@aftab>
 <4B82BD01.3030008@zytor.com>
 <20100222184945.GD21233@aftab>
 <4B82E144.1050007@zytor.com>
 <20100223155852.GF30382@aftab>
 <4B84118C.90203@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4B84118C.90203@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@amd64.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Wu Fengguang <fengguang.wu@intel.com>, LKML <linux-kernel@vger.kernel.org>, Jamie Lokier <jamie@shareable.org>, Roland Dreier <rdreier@cisco.com>, Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Brian Gerst <brgerst@gmail.com>

From: "H. Peter Anvin" <hpa@zytor.com>
Date: Tue, Feb 23, 2010 at 09:34:04AM -0800

> On 02/23/2010 07:58 AM, Borislav Petkov wrote:
> >
> >Hmm, we cannot do that with the current design since __arch_hweight64
> >is being inlined into every callsite and AFAICT we would have to build
> >every callsite with "-fcall-saved-rdi" which is clearly too much. The
> >explicit "=D" dummy constraint is straightforward, instead.
> >
> 
> Uh... the -fcall-saved-rdi would go with all the other ones.
> Assuming it can actually work and that gcc doesn't choke on an
> inbound argument being saved.

Right, doh. Ok, just added it and it builds fine with a gcc (Gentoo
4.4.1 p1.0) 4.4.1. If you have suspicion that some older gcc versions
might choke on it, I could leave the "=D" dummy constraint in?

BTW, the current version screams

/usr/src/linux-2.6/arch/x86/include/asm/arch_hweight.h: In function ‘__arch_hweight64’:
/usr/src/linux-2.6/arch/x86/include/asm/arch_hweight.h:47: warning: unused variable ‘dummy’

on x86-32. I'll send a fixed version in a second.

-- 
Regards/Gruss,
Boris.

-
Advanced Micro Devices, Inc.
Operating Systems Research Center
