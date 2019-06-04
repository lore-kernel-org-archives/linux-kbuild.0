Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44032 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfFDXfN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 19:35:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so17700475lfm.11
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jun 2019 16:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-3-brendanhiggins@google.com> <20190517003847.0962F2082E@mail.kernel.org>
In-Reply-To: <20190517003847.0962F2082E@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 4 Jun 2019 16:34:58 -0700
Message-ID: <CAFd5g45taSVNXSQJrXnHLG_Rtum650vFw1zccqv1Tyru5A5d8w@mail.gmail.com>
Subject: Re: [PATCH v4 02/18] kunit: test: add test resource management API
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, "Bird, Timothy" <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com

On Thu, May 16, 2019 at 5:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-05-14 15:16:55)
> > diff --git a/kunit/test.c b/kunit/test.c
> > index 86f65ba2bcf92..a15e6f8c41582 100644
> > --- a/kunit/test.c
> > +++ b/kunit/test.c
> [..]
> > +
> > +void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
> > +{
> > +       struct kunit_kmalloc_params params;
> > +       struct kunit_resource *res;
> > +
> > +       params.size = size;
> > +       params.gfp = gfp;
> > +
> > +       res = kunit_alloc_resource(test,
> > +                                  kunit_kmalloc_init,
> > +                                  kunit_kmalloc_free,
> > +                                  &params);
> > +
> > +       if (res)
> > +               return res->allocation;
> > +       else
> > +               return NULL;
>
> Can be written as
>
>         if (res)
>                 return ....
>         return
>
> and some static analysis tools prefer this.

Sounds reasonable, will fix in next revision.

> > +}
> > +
> > +void kunit_cleanup(struct kunit *test)
> > +{
> > +       struct kunit_resource *resource, *resource_safe;
> > +       unsigned long flags;
> > +
> > +       spin_lock_irqsave(&test->lock, flags);
>
> Ah ok, test->lock is protecting everything now? Does it need to be a
> spinlock, or can it be a mutex?

No it needs to be a spin lock. There are some conceivable
circumstances where the test object can be accessed by code in which
it isn't safe to sleep.

> > +       list_for_each_entry_safe(resource,
> > +                                resource_safe,
> > +                                &test->resources,
> > +                                node) {
> > +               kunit_free_resource(test, resource);
> > +       }
> > +       spin_unlock_irqrestore(&test->lock, flags);
> > +}
> > +
