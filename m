Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46193 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730078AbfDYVhX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Apr 2019 17:37:23 -0400
Received: by mail-oi1-f193.google.com with SMTP id l12so1259503oie.13
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Apr 2019 14:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190404220652.19765-1-brendanhiggins@google.com>
 <20190404220652.19765-15-brendanhiggins@google.com> <20190424185813.xabwr4lt6aunvpsd@gabell>
In-Reply-To: <20190424185813.xabwr4lt6aunvpsd@gabell>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 25 Apr 2019 14:37:11 -0700
Message-ID: <CAFd5g45CD7=dMvvRgmLKomirXDWpO59hFSed9A=o0kdBxp7v-w@mail.gmail.com>
Subject: Re: [PATCH v1 14/17] Documentation: kunit: add documentation for KUnit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Rob Herring <robh@kernel.org>, shuah@kernel.org, yamada.masahiro@socionext.com, Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, Sasha Levin <Alexander.Levin@microsoft.com>, linux-kselftest@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, Joel Stanley <joel@jms.id.au>, Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>, devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird, Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>, kunit-dev@googlegroups.com, Richard Weinberger <richard@nod.at>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Michael Ellerman <mpe@ellerman.id.au>, linux-fsdevel@vger.kernel.org

On Wed, Apr 24, 2019 at 11:58 AM Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
>
> Hi Brendan,
>
> KUNIT_ASSERT_NOT_ERR_OR_NULL() should be replaced to
> KUNIT_EXPECT_NOT_ERR_OR_NULL(), right?

Generally speaking, no.

There may be places that I have used it improperly, but I think it is
generally okay to use.

If you are refering to the discussion with Frank and Stephen in RFC
v4, my take was that the resolution was that there were some things I
needed to fix in its implementation, but it is conceptually okay, and
that Frank doesn't want me to use it in drivers/of/unittest.c.
Consequently, I fixed the implementation issues that Frank and Stephen
pointed out, and I am holding off on drivers/of/unittest.c for this
patchset. The usage in this file should be fine.

>
> On Thu, Apr 04, 2019 at 03:06:49PM -0700, Brendan Higgins wrote:
> > Add documentation for KUnit, the Linux kernel unit testing framework.
> > - Add intro and usage guide for KUnit
> > - Add API reference
> >
> > Signed-off-by: Felix Guo <felixguoxiuping@gmail.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
>
> <snip>

<snip>

Cheers
