Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:40378 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbaGLLLc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Jul 2014 07:11:32 -0400
Received: by mail-la0-f42.google.com with SMTP id pn19so1633115lab.15
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Jul 2014 04:11:30 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: include guard weirdness
References: <87a98gnmeg.fsf@rasmusvillemoes.dk> <53BFD6A8.5080803@suse.cz>
Date: Sat, 12 Jul 2014 13:11:28 +0200
In-Reply-To: <53BFD6A8.5080803@suse.cz> (Michal Marek's message of "Fri, 11
	Jul 2014 14:20:56 +0200")
Message-ID: <87y4vyzva7.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Michal Marek <mmarek@suse.cz> writes:

> On 2014-07-11 13:51, Rasmus Villemoes wrote:
>> Hi,
>> 
>> gcc/cpp claims to be smart enough to recognize the include guard idiom,
>> and most of the time this works very well: the second and subsequent
>> #includes do not even cause the file to be opened (thus saving at least
>> open+fstat+read+close). Except in a few cases, which are so common that
>> it might be worth investigating.
>> 
>> For example, linux/mm.h often shows up exactly twice in strace output;
>> another very common header such as linux/types.h always occurs only
>> once.
>
> My guess is that <linux/mm.h> includes a header which at some point
> includes <linux/mm.h> again.

Indeed. I naively thought that the kernel didn't have any cyclic
includes, but if ever I was wrong about something... 

The cycle is very short (mm.h and vmstat.h include each
other). Including vmstat.h before mm.h breaks the build. 

Thanks for enlightening me,
Rasmus
