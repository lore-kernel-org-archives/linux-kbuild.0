Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out6.electric.net ([192.162.217.185]:58926 "EHLO
        smtp-out6.electric.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751145AbdKURkE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Nov 2017 12:40:04 -0500
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Date: Tue, 21 Nov 2017 17:23:52 +0000
Message-ID: <1f19a8816278495f997f4331ef0e015e@AcuMS.aculab.com>
References: <CAKwvOd=k=iVQvWmzP1E3XHUCYLoJgx+F9zoPuE+R2oaw_ePUVA@mail.gmail.com>
 <20171116173417.nqsh5dpu65uj7b5s@hirez.programming.kicks-ass.net>
 <20171116174830.GX3624@linux.vnet.ibm.com>
 <CAKwvOdkDz1yRo=Skt_mWxs0uucK+adXx8kFQksMbTE3ofnpUMQ@mail.gmail.com>
 <20171116183950.GA3624@linux.vnet.ibm.com> <20171116184508.GC21898@arm.com>
 <20171116191307.GC3624@linux.vnet.ibm.com>
 <20171116201701.GA143965@samitolvanen.mtv.corp.google.com>
 <20171120180554.GM32488@arm.com>
 <20171120193256.e6fnn2arwqc5wqkp@hirez.programming.kicks-ass.net>
 <20171120205350.GZ3624@linux.vnet.ibm.com>
In-Reply-To: <20171120205350.GZ3624@linux.vnet.ibm.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "'paulmck@linux.vnet.ibm.com'" <paulmck@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will.deacon@arm.com>, Sami Tolvanen <samitolvanen@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Alexander Potapenko <glider@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>

From: Paul E. McKenney
> Sent: 20 November 2017 20:54
> 
> On Mon, Nov 20, 2017 at 08:32:56PM +0100, Peter Zijlstra wrote:
> > On Mon, Nov 20, 2017 at 06:05:55PM +0000, Will Deacon wrote:
> > > Although the current direction of the C++ committee is to prefer
> > > that dependencies are explicitly "marked", this is not deemed to be
> > > acceptable for the kernel (in other words, everything is always considered
> > > "marked").
> >
> > Yeah, that is an attitude not compatible with existing code. Much like
> > the proposal to allow temporary/wide stores on everything not explicitly
> > declared atomic. Such stuff instantly breaks all extant code that does
> > multi-threading with no recourse.
> 
> If someone suggests temporary/wide stores, even on non-atomics, tell
> them that the standard does not permit them to introduce data races.

The C standard doesn't say anything about multi-threading.

The x86 bis (bit set) family are well known for being problematic
because they always do a 32bit wide rmw cycle.

	David

