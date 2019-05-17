Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35243 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbfEQDOh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 23:14:37 -0400
Received: by mail-qt1-f193.google.com with SMTP id a39so6502634qtk.2
        for <linux-kbuild@vger.kernel.org>; Thu, 16 May 2019 20:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com> <20190516225013.nvhwqi5tfwtby6qb@treble>
In-Reply-To: <20190516225013.nvhwqi5tfwtby6qb@treble>
From: Ivan Babrou <ivan@cloudflare.com>
Date: Thu, 16 May 2019 20:14:25 -0700
Message-ID: <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

We are building the upstream kernel. There are a few patches, but
nothing related to objtool.

Unless you mean mainline/stable by upstream, I haven't tried that. We
stick to LTS.

On Thu, May 16, 2019 at 7:04 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, May 16, 2019 at 11:20:54PM +0200, Miguel Ojeda wrote:
> > > mm/slub.o: warning: objtool: init_cache_random_seq()+0x36: sibling
> > > call from callable instruction with modified stack frame
> > > mm/slub.o: warning: objtool: slab_out_of_memory()+0x3b: sibling call
> > > from callable instruction with modified stack frame
> > > mm/slub.o: warning: objtool: slab_pad_check.part.0()+0x7c: sibling
> > > call from callable instruction with modified stack frame
> > > mm/slub.o: warning: objtool: check_slab()+0x1c: sibling call from
> > > callable instruction with modified stack frame
> >
> > AFAIK those are non-critical, i.e. stack traces may be wrong (or not),
> > but it does not mean the generated kernel itself is wrong. CC'ing the
> > objtool maintainers too.
>
> I don't think I recognize those warnings.  Do you also see them in the
> upstream kernel?
>
> --
> Josh
