Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:54156 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbfEQHib (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 03:38:31 -0400
Date: Fri, 17 May 2019 09:38:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190517073813.GB2589@hirez.programming.kicks-ass.net>
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble>
 <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517050931.GB32367@kroah.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ivan Babrou <ivan@cloudflare.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

On Fri, May 17, 2019 at 07:09:31AM +0200, Greg KH wrote:
> On Thu, May 16, 2019 at 08:14:25PM -0700, Ivan Babrou wrote:
> > We are building the upstream kernel. There are a few patches, but
> > nothing related to objtool.
> > 
> > Unless you mean mainline/stable by upstream, I haven't tried that. We
> > stick to LTS.
> 
> Please work and all of these issues fixed up in Linus's tree and then I
> will be glad to take the fixed into the stable releases.

Right; if there is anything you can reproduce on linus.git I'll happily
have a look. If it doesn't reproduce all you have to do is find the
patches that make it work and ask Greg.
