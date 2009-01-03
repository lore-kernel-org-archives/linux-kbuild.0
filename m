Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.185]:7496 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758530AbZACOFw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 Jan 2009 09:05:52 -0500
Received: by ti-out-0910.google.com with SMTP id b6so9067049tic.23
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Jan 2009 06:05:49 -0800 (PST)
Message-ID: <df9815e70901030605v4e2c2bc2y4827a15fd165d3f4@mail.gmail.com>
Date: Sat, 3 Jan 2009 22:05:49 +0800
From: "Jike Song" <albcamus@gmail.com>
Subject: Re: [PATCH] Kbuild: reintroduce ALLSOURCE_ARCHS support for tags/cscope.
In-Reply-To: <20090102223213.GA8843@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1230730656-2987-1-git-send-email-albcamus@gmail.com>
	 <20090102223213.GA8843@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Sat, Jan 3, 2009 at 6:32 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Dec 31, 2008 at 09:37:36PM +0800, Jike Song wrote:
>> This patch reintroduce the ALLSOURCE_ARCHS support for tags/TAGS/
>> cscope targets. The Kbuild previously has this feature, but after
>> moving the targets into scripts/tags.sh, ALLSOURCE_ARCHS disappears.
>>
>> It's something like this:
>>
>>       $ make ALLSOURCE_ARCHS="x86 mips arm" tags cscope
>
> Hi Jike.
>
> Did you implment this feature because you really use it
> or did you do so because it was 'missing'?

There are many people who works on multiple architectures.  As for me,
I work on both x86 and MIPS, and I always specify ALLSOURCE_ARCHS="x86
mips" when building tags/cscope databases.  I think this would be a
useful feature for these people;-)

Anyway, it is dependent on your decision.

>
> I explicitly avoided the feature as I expected it to be used
> very seldom.

Maybe just because it is undocumented?

>        Sam
>


-- 
Thanks,
Jike
