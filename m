Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54882 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907AbbAWMsl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Jan 2015 07:48:41 -0500
Message-id: <54C24321.5010205@samsung.com>
Date: Fri, 23 Jan 2015 15:48:33 +0300
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: [PATCH v9 01/17] Add kernel address sanitizer infrastructure.
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
 <1421859105-25253-1-git-send-email-a.ryabinin@samsung.com>
 <1421859105-25253-2-git-send-email-a.ryabinin@samsung.com>
 <54C23FFB.5010800@suse.cz>
In-reply-to: <54C23FFB.5010800@suse.cz>
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org
Cc: Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Dmitry Chernenkov <dmitryc@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@intel.com>, Andi Kleen <andi@firstfloor.org>, x86@kernel.org, linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

On 01/23/2015 03:35 PM, Michal Marek wrote:
> On 2015-01-21 17:51, Andrey Ryabinin wrote:
>> +ifdef CONFIG_KASAN_INLINE
>> +	call_threshold := 10000
>> +else
>> +	call_threshold := 0
>> +endif
> 
> Can you please move this to a Kconfig helper like you did with
> CONFIG_KASAN_SHADOW_OFFSET? Despite occasional efforts to reduce the
> size of the main Makefile, it has been growing over time. With this
> patch set, we are approaching 2.6.28's record of 1669 lines.
> 

How about moving the whole kasan stuff into scripts/Makefile.kasan
and just include it in generic Makefile?

> Michal
> 

