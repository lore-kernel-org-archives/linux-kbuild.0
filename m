Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43183 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751202AbdCQTcC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Mar 2017 15:32:02 -0400
Date: Fri, 17 Mar 2017 20:27:46 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 6/7] md/raid10, LLVM: get rid of variable length array
Message-ID: <20170317192746.y5ade3bymifdni2p@hirez.programming.kicks-ass.net>
References: <20170317001520.85223-1-md@google.com>
 <20170317001520.85223-7-md@google.com>
 <20170317120837.pr74cv3xuj7qpoin@hirez.programming.kicks-ass.net>
 <CAG_fn=XcQLtcHRSm2BHYce9LMtyFJ+fWxfE4vYPCw+7U0DcrmQ@mail.gmail.com>
 <20170317124404.mt3jd5q5vyk63q2w@hirez.programming.kicks-ass.net>
 <CA+=D-XXy9yEQc-jLxSqRUwq=4ADnFqaxnsjSzV4=8jOisym=bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=D-XXy9yEQc-jLxSqRUwq=4ADnFqaxnsjSzV4=8jOisym=bQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Davidson <md@google.com>
Cc: Alexander Potapenko <glider@google.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Matthias Kaehlcke <mka@chromium.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org

On Fri, Mar 17, 2017 at 11:52:01AM -0700, Michael Davidson wrote:
> On Fri, Mar 17, 2017 at 5:44 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Be that as it may; what you construct above is disgusting. Surely the
> > code can be refactored to not look like dog vomit?
> >
> > Also; its not immediately obvious conf->copies is 'small' and this
> > doesn't blow up the stack; I feel that deserves a comment somewhere.
> >
> 
> I agree that the code is horrible.
> 
> It is, in fact, exactly the same solution that was used to remove
> variable length arrays in structs from several of the crypto drivers a
> few years ago - see the definition of SHASH_DESC_ON_STACK() in
> "crypto/hash.h" - I did not, however, hide the horrors in a macro
> preferring to leave the implementation visible as a warning to whoever
> might touch the code next.
> 
> I believe that the actual stack usage is exactly the same as it was previously.
> 
> I can certainly wrap this  up in a macro and add comments with
> appropriately dire warnings in it if you feel that is both necessary
> and sufficient.

We got away with ugly in the past, so we should get to do it again?
