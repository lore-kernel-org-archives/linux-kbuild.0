Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38456 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfECAoR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 May 2019 20:44:17 -0400
Received: by mail-oi1-f195.google.com with SMTP id t70so3236087oif.5
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2019 17:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com> <76e84d54-6b7e-8cc1-492b-43822fc43ac4@kernel.org>
In-Reply-To: <76e84d54-6b7e-8cc1-492b-43822fc43ac4@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 17:44:05 -0700
Message-ID: <CAFd5g47JiSXHvMEu9NovkGdG7ugMCwVO0pGwT7bC=NCghD0w-g@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shuah <shuah@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, "Bird, Timothy" <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com

On Thu, May 2, 2019 at 7:04 AM shuah <shuah@kernel.org> wrote:
>
> On 5/2/19 4:50 AM, Greg KH wrote:
> > On Wed, May 01, 2019 at 04:01:09PM -0700, Brendan Higgins wrote:
> >> ## TLDR
> >>
> >> I rebased the last patchset on 5.1-rc7 in hopes that we can get this in
> >> 5.2.
> >
> > That might be rushing it, normally trees are already closed now for
> > 5.2-rc1 if 5.1-final comes out this Sunday.
> >
> >> Shuah, I think you, Greg KH, and myself talked off thread, and we agreed
> >> we would merge through your tree when the time came? Am I remembering
> >> correctly?
> >
> > No objection from me.
> >
>
> Yes. I can take these through kselftest tree when the time comes.

Awesome.

> Agree with Greg that 5.2 might be rushing it. 5.3 would be a good
> target.

Whoops. I guess I should have sent this out a bit earlier. Oh well, as
long as we are on our way!
