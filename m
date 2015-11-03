Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:45224 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870AbbKCSre (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2015 13:47:34 -0500
Subject: Re: [PATCH v2 0/2] UBSan: run-time undefined behavior sanity checker
References: <1415969446-26356-1-git-send-email-a.ryabinin@samsung.com>
 <5638ECEC.1030604@oracle.com>
 <CAPAsAGzEaA26QoUam3_H4Ygcs__ZwYbsu+V3nZ8e0uqYNPMo4Q@mail.gmail.com>
From: Sasha Levin <sasha.levin@oracle.com>
Message-ID: <56390114.7030902@oracle.com>
Date: Tue, 3 Nov 2015 13:46:44 -0500
MIME-Version: 1.0
In-Reply-To: <CAPAsAGzEaA26QoUam3_H4Ygcs__ZwYbsu+V3nZ8e0uqYNPMo4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, "x86@kernel.org" <x86@kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

On 11/03/2015 01:15 PM, Andrey Ryabinin wrote:
> 2015-11-03 20:20 GMT+03:00 Sasha Levin <sasha.levin@oracle.com>:
>> Anyone knows why wasn't this merged a year ago? I didn't see any review comments, and it
>> ended up finding real bugs.
>>
> 
> Probably because I didn't ping so it just lost.
> I'll send v3 after the merge window.
> 

Thanks Andrey!

I've just tried v2 on -next, and that causes a hang during boot (seems like we're
hitting undefined behavior while already handling undefined behaviour.


Thanks,
Sasha
