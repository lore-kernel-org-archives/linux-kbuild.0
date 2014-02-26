Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:64083 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255AbaBZBb1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Feb 2014 20:31:27 -0500
Received: by mail-pa0-f53.google.com with SMTP id ld10so41096pab.12
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2014 17:31:27 -0800 (PST)
Message-ID: <530D43E9.6010207@converseincode.com>
Date: Tue, 25 Feb 2014 17:31:21 -0800
From: Behan Webster <behanw@converseincode.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] kbuild: LLVMLinux: Adapt warnings for compilation
 with clang
References: <1393376923-21892-1-git-send-email-behanw@converseincode.com> <1393376923-21892-3-git-send-email-behanw@converseincode.com> <20140226011737.GA4564@redhat.com>
In-Reply-To: <20140226011737.GA4564@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dave Jones <davej@redhat.com>, mmarek@suse.cz, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, sparse@chrisli.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sparse@vger.kernel.org, torvalds@linux-foundation.org, dwmw2@infradead.org, pageexec@freemail.hu, =?ISO-8859-1?Q?Jan-Simon_M=F6?= =?ISO-8859-1?Q?ller?= <dl9pf@gmx.de>, Mark Charlebois <mcharleb@gmail.com>

On 02/25/14 17:17, Dave Jones wrote:
> On Tue, Feb 25, 2014 at 05:08:40PM -0800, behanw@converseincode.com wrote:
>   > +warning-1 += $(call cc-disable-warning, self-assign)
>
> Do you have a pointer to an example log-file from before this change ?
> I'm curious for eg, which self-assign warnings are showing up,
> because I've been fixing up the ones that Coverity found, of which
> there are only a dozen or so left iirc.
>
> Some of the others may also be interesting.
I don't have one now, but I can generate a log and send it to you. We've 
had that option set from near the beginning of the porting effort.

This are primarily off due to the amount of noise these warnings produce 
at this time (clang produces a LOT of warnings straight out of the box). 
I'd love to eventually turn some of these back on again.

Thanks,

Behan

-- 
Behan Webster
behanw@converseincode.com

