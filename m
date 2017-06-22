Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([65.50.211.136]:54959 "EHLO mail.zytor.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753841AbdFVWuw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 18:50:52 -0400
Subject: Re: [PATCH 5/7] x86, boot, LLVM: Use regparm=0 for memcpy and memset
References: <20170317001520.85223-1-md@google.com>
 <20170317001520.85223-6-md@google.com>
 <20170317120855.zwqame63yvy5afhg@hirez.programming.kicks-ass.net>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <c6f5b08c-1de8-15a7-81c2-b41aad7d1c8b@zytor.com>
Date: Thu, 22 Jun 2017 15:38:19 -0700
MIME-Version: 1.0
In-Reply-To: <20170317120855.zwqame63yvy5afhg@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Michael Davidson <md@google.com>
Cc: Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Kaehlcke <mka@chromium.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org

On 03/17/17 05:08, Peter Zijlstra wrote:
> On Thu, Mar 16, 2017 at 05:15:18PM -0700, Michael Davidson wrote:
>> Use the standard regparm=0 calling convention for memcpy and
>> memset when building with clang.
>>
>> This is a work around for a long standing clang bug
>> (see https://llvm.org/bugs/show_bug.cgi?id=3997) where
>> clang always uses the standard regparm=0 calling convention
>> for any implcit calls to memcpy and memset that it generates
>> (eg for structure assignments and initialization) even if an
>> alternate calling convention such as regparm=3 has been specified.
> 
> Seriously, fix LLVM already.
> 

Yes, this is a real stinker, in no small part because once clang is
fixed to DTRT then this is actually broken...

	-hpa

