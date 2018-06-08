Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:40454 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752754AbeFHUs5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 16:48:57 -0400
Subject: Re: [PATCH] uapi: Make generic uapi headers compile standalone.
References: <20180606231602.231326-1-jchowdhary@google.com>
 <b6b6dd56-c948-54e8-df95-3d170a3c1e7d@infradead.org>
 <fe1d69e1-1a0f-a3ea-e45f-994698d53dbd@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cf1b59ad-994b-f6ac-8e58-2b24ef346c49@infradead.org>
Date: Fri, 8 Jun 2018 13:48:50 -0700
MIME-Version: 1.0
In-Reply-To: <fe1d69e1-1a0f-a3ea-e45f-994698d53dbd@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jayant Chowdhary <jchowdhary@google.com>, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, kernel-team@android.com, linux-kbuild@vger.kernel.org

On 06/08/2018 11:36 AM, Jayant Chowdhary wrote:
> Hi Randy,
> 
> On 06/07/2018 05:07 PM, Randy Dunlap wrote:
>> On 06/06/2018 04:16 PM, Jayant Chowdhary wrote:
>>> In order for static analysis tools to analyze each of the uapi headers,
>>> we need to enable them to compile stand-alone. Some uapi headers were
>>> missing dependencies which would not make them compile stand-alone in
>>> user-land. This patch adds those dependencies.
>>
>> Hi,
>>
>> Thanks for getting started on this.  I see that the kbuild robot and I were
>> still not able to do successful builds even after this patch is applied.
>> We were building different targets though.  robot was doing kernel builds
>> and I was doing a large "all-uapi" build.
>>
>> I started on my all-uapi work about 1 week ago but haven't posted anything yet,
>> but it's posted (attached) below.  It's not yet up to kernel quality yet (for a
>> Makefile), and I have made very little progress toward a successful userspace build.
>>
>> If anyone is interested, just put these 3 files in <kernel_tree>/tools/build
>> and then run:
>>
>> make ARCH=$some_arch O=build_dir headers_check
>> so that the headers will be cleaned up and installed in build_dir/usr/.
>>
>> Then run 'make -f all-uapi.mk'
>> and the userspace program with all header files found in build_dir/usr/include
>> will be built -- i.e., attempted (not successfully).
>>
>> (note: chmod +x hdr-fix-lines.pl)
>>
>>
> 
> Thank you for this. This is surely a more formal way of finding out and
> verifying problems w.r.t the uapi headers, being compiled from user-land. I do
> have one concern with this approach though: the make target 'all-uapi.o' depends
> on all-uapi.h, which includes all the uapi headers installed in <build-dir>. So
> this does make sure that when all the uapi headers are included, a user-land
> program will be able to compile fine, without adding any additional
> dependencies. However, this could be masking some cases of dependency exclusion.
> An example can be seen as follows:
> 
> Header dependency chain:
> A.h->B.h, however A.h doesn't actually include B.h
> C.h->B.h, C.h does include B.h
> 
> all-uapi.h
> #include<C.h>
> #include<A.h>
> 
> all-uapi.h will compile fine, since the inclusion of C.h before A.h satisfies
> A.h's dependency on B.h. However, if a user-land program includes just A.h, it
> will not compile without adding B.h. So the target being built successfully
> masked an issue with the uapi header, no?

Yes, good point.

> I guess it might be better to just have a Makefile which produces a target for
> each header in the set produced by 'make headers_install' and compile those,
> with a -I flag as <build-dir>/usr/include ?

Yes, that makes sense.  Should be fairly straightforward to do that.

> Also, do you think it might be better to do this work in phases ? I'm guessing
> we'll be seeing many headers to fix (especially arch specific ones). Fixing
> these separately: first the generic ones, followed by the ones for the arches,
> might be easier ?

Absolutely.  I was planning to just focus on one sub-directory of
usr/include/choose_one (and begin with a smaller one).


thanks,
-- 
~Randy
