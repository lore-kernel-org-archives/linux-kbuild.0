Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37402 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728749AbfEQPWG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 11:22:06 -0400
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Fri, 17 May 2019 12:22:00 -0300
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190517152200.GI8945@kernel.org>
References: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble>
 <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
 <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, Ivan Babrou <ivan@cloudflare.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

Em Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda escreveu:
> On Fri, May 17, 2019 at 10:51 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, May 17, 2019 at 10:35:29AM +0200, Miguel Ojeda wrote:
> > > On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > Right; if there is anything you can reproduce on linus.git I'll happily
> > > > have a look. If it doesn't reproduce all you have to do is find the
> > > > patches that make it work and ask Greg.
> > >
> > > Just to clarify: Linus' master is clean of these issues with GCC 9.1.1.
> >
> > Great!  Care to find the patches that did that work and send me the git
> > commit ids so that I can queue them up?  I don't have gcc9 here yet on
> > my systems, so I can not test for this.
> 
> I am unsure about the perf and the objtools parts (Peter/Josh?), but

I'm not noticing these while building upstream perf with gcc 9.1.1 on at
least fedora:30.

    33	fedora:30                     : Ok   gcc (GCC) 9.1.1 20190503 (Red Hat 9.1.1-1)

> about the -Wmissing-attributes I cleaned, they were these:
 
> a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
> init/cleanup_module")
> c0d9782f5b6d ("Compiler Attributes: add support for __copy (gcc >= 9)")
> ff98e20ef208 ("lib/crc32.c: mark crc32_le_base/__crc32c_le_base
> aliases as __pure")
> 
> Cheers,
> Miguel

-- 

- Arnaldo
