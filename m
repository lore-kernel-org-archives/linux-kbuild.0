Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42476 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbfEQJ1x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 05:27:53 -0400
MIME-Version: 1.0
References: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble> <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com> <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com> <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517092302.GA5235@kroah.com>
In-Reply-To: <20190517092302.GA5235@kroah.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 May 2019 11:27:41 +0200
Message-ID: <CANiq72=HpvQx1t+W3YwY-6Rdw1F6UJbVkAzJFdE61H668B8s2g@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ivan Babrou <ivan@cloudflare.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

On Fri, May 17, 2019 at 11:23 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda wrote:
>
> > a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
> > init/cleanup_module")
>
> That patch I applied now.

Note that this one requires the second one (c0d9782f5b6d).

Cheers,
Miguel
