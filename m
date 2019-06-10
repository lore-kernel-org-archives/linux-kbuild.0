Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389123AbfFJOtB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jun 2019 10:49:01 -0400
Date: Mon, 10 Jun 2019 16:48:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190610144858.GA1481@kroah.com>
References: <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org>
 <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org>
 <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
 <20190610074510.GA24746@kroah.com>
 <CALrw=nEp=hUUaKtuU3Q1c_zKO3zYC3uP_s_Dyz_zhkxW7K+4mQ@mail.gmail.com>
 <20190610142145.GC5937@kroah.com>
 <CANiq72kxyKV1z+dGmMtuq=gUWOYS=Y0EsNFqLKoFXWx6+n=J1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kxyKV1z+dGmMtuq=gUWOYS=Y0EsNFqLKoFXWx6+n=J1g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ignat Korchagin <ignat@cloudflare.com>, Ivan Babrou <ivan@cloudflare.com>, Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

On Mon, Jun 10, 2019 at 04:42:27PM +0200, Miguel Ojeda wrote:
> On Mon, Jun 10, 2019 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > > I also checked that 4.19.49 compiles fine with GCC 9, although with a
> > > lot of warnings, mostly from objtool, like "warning: objtool:
> > > sock_register()+0xd: sibling call from callable instruction with
> > > modified stack frame". But it's a start.
> 
> I think Josh Poimboeuf added support for a few related things in GCC 8
> (e.g. 13810435b9a7 ("objtool: Support GCC 8's cold subfunctions")).

That commit is already in all stable releases, so does there need to be
a gcc 9 specific one?

> > I'll look into these after the next round of kernels are released.  I
> > guess I'll go find a distro that has gcc9 on it to actually test
> > things...
> 
> I typically compile a bare-bones GCC for those things, it is quite quick.

Pointers to how to do that is appreciated.  It's been years since I had
to build gcc "from scratch".

thanks,

greg k-h
