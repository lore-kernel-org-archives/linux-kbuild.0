Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43342 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726354AbgD3EKo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 00:10:44 -0400
Date: Wed, 29 Apr 2020 23:10:33 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
Message-ID: <20200430041033.x7hggzh2lsbtc3u7@treble>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
 <20200429084933.GF13592@hirez.programming.kicks-ass.net>
 <1CACF61E-FA7C-4986-AAD2-20A3B2BAC425@linux.alibaba.com>
 <20200430040654.mnkcfmj32tr6m3mg@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200430040654.mnkcfmj32tr6m3mg@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: changhuaixin <changhuaixin@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, bp@alien8.de, hpa@zytor.com, luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com, tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com

On Wed, Apr 29, 2020 at 11:06:58PM -0500, Josh Poimboeuf wrote:
> On Thu, Apr 30, 2020 at 10:32:17AM +0800, changhuaixin wrote:
> > 
> > 
> > > On Apr 29, 2020, at 4:49 PM, Peter Zijlstra <peterz@infradead.org> wrote:
> > > 
> > > On Wed, Apr 29, 2020 at 02:46:24PM +0800, Huaixin Chang wrote:
> > >> Move building of fast lookup table from boot to sorttable tool. This saves us
> > >> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.
> > > 
> > > And what does it add to the build time?
> > 
> > It takes a little more than 7ms to build fast lookup table in
> > sorttable on the same CPU. And it is on the critical path.
> 
> Thanks, I like it.  It will help make the in-kernel unwinder even
> simpler.  And it will enable unwinding from early boot.
> 
> Maybe someday we can move all the table sorting code into objtool, once
> we have objtool running on vmlinux.o.
> 
> I'll try to review the patches soon.

BTW, another cool feature would be for sorttable to run on modules
during the module linking phase.

-- 
Josh
