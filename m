Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42449 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730720AbfGOUaf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 16:30:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id t132so8251106pgb.9
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2019 13:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-3-brendanhiggins@google.com> <20190715202425.CE64C20665@mail.kernel.org>
In-Reply-To: <20190715202425.CE64C20665@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 15 Jul 2019 13:30:22 -0700
Message-ID: <CAFd5g45iHnMLOGQbXwzX6F74pkQGKBCSufkpYPOcw_iNSeiQKg@mail.gmail.com>
Subject: Re: [PATCH v9 02/18] kunit: test: add test resource management API
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, "Bird, Timothy" <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com

On Mon, Jul 15, 2019 at 1:24 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-07-12 01:17:28)
> > diff --git a/kunit/test.c b/kunit/test.c
> > index 571e4c65deb5c..f165c9d8e10b0 100644
> > --- a/kunit/test.c
> > +++ b/kunit/test.c
> > @@ -171,6 +175,96 @@ int kunit_run_tests(struct kunit_suite *suite)
> >         return 0;
> >  }
> >
> > +struct kunit_resource *kunit_alloc_resource(struct kunit *test,
> > +                                           kunit_resource_init_t init,
> > +                                           kunit_resource_free_t free,
> > +                                           void *context)
> > +{
> > +       struct kunit_resource *res;
> > +       int ret;
> > +
> > +       res = kzalloc(sizeof(*res), GFP_KERNEL);
>
> This uses GFP_KERNEL.
>
> > +       if (!res)
> > +               return NULL;
> > +
> > +       ret = init(res, context);
> > +       if (ret)
> > +               return NULL;
> > +
> > +       res->free = free;
> > +       mutex_lock(&test->lock);
>
> And this can sleep.
>
> > +       list_add_tail(&res->node, &test->resources);
> > +       mutex_unlock(&test->lock);
> > +
> > +       return res;
> > +}
> > +
> > +void kunit_free_resource(struct kunit *test, struct kunit_resource *res)
>
> Should probably add a note that we assume the test lock is held here, or
> even add a lockdep_assert_held(&test->lock) into the function to
> document that and assert it at the same time.

Seems reasonable.

> > +{
> > +       res->free(res);
> > +       list_del(&res->node);
> > +       kfree(res);
> > +}
> > +
> > +struct kunit_kmalloc_params {
> > +       size_t size;
> > +       gfp_t gfp;
> > +};
> > +
> > +static int kunit_kmalloc_init(struct kunit_resource *res, void *context)
> > +{
> > +       struct kunit_kmalloc_params *params = context;
> > +
> > +       res->allocation = kmalloc(params->size, params->gfp);
> > +       if (!res->allocation)
> > +               return -ENOMEM;
> > +
> > +       return 0;
> > +}
> > +
> > +static void kunit_kmalloc_free(struct kunit_resource *res)
> > +{
> > +       kfree(res->allocation);
> > +}
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
>
> This calls that sleeping function above...
>
> > +                                  kunit_kmalloc_init,
> > +                                  kunit_kmalloc_free,
> > +                                  &params);
>
> but this passes a GFP flags parameter through to the
> kunit_kmalloc_init() function. How is this going to work if some code
> uses GFP_ATOMIC, but then we try to allocate and sleep in
> kunit_alloc_resource() with GFP_KERNEL?

Yeah, that's an inconsistency. I need to fix that.

> One solution would be to piggyback on all the existing devres allocation
> logic we already have and make each struct kunit a device that we pass
> into the devres functions. A far simpler solution would be to just
> copy/paste what devres does and use a spinlock and an allocation
> function that takes GFP flags.

Yeah, that's what I did originally, but I thought from the discussion
on patch 01 that you thought a spinlock was overkill for struct kunit.
I take it you only meant in that initial patch?

> > +
> > +       if (res)
> > +               return res->allocation;
> > +
> > +       return NULL;
> > +}

Cheers
