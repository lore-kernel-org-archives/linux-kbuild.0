Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731055AbfGOUY1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 16:24:27 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190712081744.87097-3-brendanhiggins@google.com>
References: <20190712081744.87097-1-brendanhiggins@google.com> <20190712081744.87097-3-brendanhiggins@google.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v9 02/18] kunit: test: add test resource management API
Date: Mon, 15 Jul 2019 13:24:25 -0700
Message-Id: <20190715202425.CE64C20665@mail.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com

Quoting Brendan Higgins (2019-07-12 01:17:28)
> diff --git a/kunit/test.c b/kunit/test.c
> index 571e4c65deb5c..f165c9d8e10b0 100644
> --- a/kunit/test.c
> +++ b/kunit/test.c
> @@ -171,6 +175,96 @@ int kunit_run_tests(struct kunit_suite *suite)
>         return 0;
>  }
> =20
> +struct kunit_resource *kunit_alloc_resource(struct kunit *test,
> +                                           kunit_resource_init_t init,
> +                                           kunit_resource_free_t free,
> +                                           void *context)
> +{
> +       struct kunit_resource *res;
> +       int ret;
> +
> +       res =3D kzalloc(sizeof(*res), GFP_KERNEL);

This uses GFP_KERNEL.

> +       if (!res)
> +               return NULL;
> +
> +       ret =3D init(res, context);
> +       if (ret)
> +               return NULL;
> +
> +       res->free =3D free;
> +       mutex_lock(&test->lock);

And this can sleep.

> +       list_add_tail(&res->node, &test->resources);
> +       mutex_unlock(&test->lock);
> +
> +       return res;
> +}
> +
> +void kunit_free_resource(struct kunit *test, struct kunit_resource *res)

Should probably add a note that we assume the test lock is held here, or
even add a lockdep_assert_held(&test->lock) into the function to
document that and assert it at the same time.

> +{
> +       res->free(res);
> +       list_del(&res->node);
> +       kfree(res);
> +}
> +
> +struct kunit_kmalloc_params {
> +       size_t size;
> +       gfp_t gfp;
> +};
> +
> +static int kunit_kmalloc_init(struct kunit_resource *res, void *context)
> +{
> +       struct kunit_kmalloc_params *params =3D context;
> +
> +       res->allocation =3D kmalloc(params->size, params->gfp);
> +       if (!res->allocation)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static void kunit_kmalloc_free(struct kunit_resource *res)
> +{
> +       kfree(res->allocation);
> +}
> +
> +void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
> +{
> +       struct kunit_kmalloc_params params;
> +       struct kunit_resource *res;
> +
> +       params.size =3D size;
> +       params.gfp =3D gfp;
> +
> +       res =3D kunit_alloc_resource(test,

This calls that sleeping function above...

> +                                  kunit_kmalloc_init,
> +                                  kunit_kmalloc_free,
> +                                  &params);

but this passes a GFP flags parameter through to the
kunit_kmalloc_init() function. How is this going to work if some code
uses GFP_ATOMIC, but then we try to allocate and sleep in
kunit_alloc_resource() with GFP_KERNEL?=20

One solution would be to piggyback on all the existing devres allocation
logic we already have and make each struct kunit a device that we pass
into the devres functions. A far simpler solution would be to just
copy/paste what devres does and use a spinlock and an allocation
function that takes GFP flags.

> +
> +       if (res)
> +               return res->allocation;
> +
> +       return NULL;
> +}
