Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:65093 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751329AbaBSGMa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Feb 2014 01:12:30 -0500
Received: by mail-pb0-f42.google.com with SMTP id jt11so17777832pbb.15
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2014 22:12:29 -0800 (PST)
Message-ID: <53044B35.3010203@converseincode.com>
Date: Tue, 18 Feb 2014 22:12:05 -0800
From: Behan Webster <behanw@converseincode.com>
MIME-Version: 1.0
Subject: Re: linux-next
References: <5303C695.4030403@converseincode.com> <20140219111753.23912fa4bdbfeba7aa6a6c52@canb.auug.org.au> <53041454.6090404@converseincode.com> <20140219060717.GA25806@ravnborg.org>
In-Reply-To: <20140219060717.GA25806@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, =?ISO-8859-1?Q?Jan-Simon_M=F6ller?= <dl9pf@gmx.de>

On 02/18/14 22:07, Sam Ravnborg wrote:
>>>> The LLVMLinux project is working on changes to the LLVM/clang toolchain
>>>> as well as to the linux kernel code in order to be able to compile the
>>>> kernel with clang.
>>> I have no objection to this, but would like to see more of these patches
>>> reviewed by (among others) the kbuild guys (cc'd).  I also could not find
>>> some of these patches published on lkml (where I would expect to see
>>> them).  And the top patch has a very uninformative commit message :-(
>> Of course. That is the intention. I'll review all the commit
>> messages as well.
> Please send the patches as least to linux-kbuild for review.
> I almost never go hunting for patches in a git repo for review,
> and this is the same for others.
Yes. The plan is to send them to the list. Just haven't got to it yet. 
Sorry for the confusion.

Like I said, at this point I was just asking about linux-next inclusion, 
and how that all worked.

Behan

-- 
Behan Webster
behanw@converseincode.com

