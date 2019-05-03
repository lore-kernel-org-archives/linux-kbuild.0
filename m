Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:38140 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbfECDPS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 May 2019 23:15:18 -0400
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-9-brendanhiggins@google.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <0a605543-477a-1854-eb35-6e586606889b@deltatee.com>
Date: Thu, 2 May 2019 21:14:08 -0600
MIME-Version: 1.0
In-Reply-To: <20190501230126.229218-9-brendanhiggins@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 08/17] kunit: test: add support for test abort
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com



On 2019-05-01 5:01 p.m., Brendan Higgins wrote:
> +/*
> + * struct kunit_try_catch - provides a generic way to run code which might fail.
> + * @context: used to pass user data to the try and catch functions.
> + *
> + * kunit_try_catch provides a generic, architecture independent way to execute
> + * an arbitrary function of type kunit_try_catch_func_t which may bail out by
> + * calling kunit_try_catch_throw(). If kunit_try_catch_throw() is called, @try
> + * is stopped at the site of invocation and @catch is catch is called.

I found some of the C++ comparisons in this series a bit distasteful but
wasn't going to say anything until I saw the try catch.... But looking
into the implementation it's just a thread that can exit early which
seems fine to me. Just a poor choice of name I guess...

[snip]

> +static void __noreturn kunit_abort(struct kunit *test)
> +{
> +	kunit_set_death_test(test, true);
> +
> +	kunit_try_catch_throw(&test->try_catch);
> +
> +	/*
> +	 * Throw could not abort from test.
> +	 *
> +	 * XXX: we should never reach this line! As kunit_try_catch_throw is
> +	 * marked __noreturn.
> +	 */
> +	WARN_ONCE(true, "Throw could not abort from test!\n");
> +}
> +
>  int kunit_init_test(struct kunit *test, const char *name)
>  {
>  	spin_lock_init(&test->lock);
> @@ -77,6 +103,7 @@ int kunit_init_test(struct kunit *test, const char *name)
>  	test->name = name;
>  	test->vprintk = kunit_vprintk;
>  	test->fail = kunit_fail;
> +	test->abort = kunit_abort;

There are a number of these function pointers which seem to be pointless
to me as you only ever set them to one function. Just call the function
directly. As it is, it is an unnecessary indirection for someone reading
the code. If and when you have multiple implementations of the function
then add the pointer. Don't assume you're going to need it later on and
add all this maintenance burden if you never use it..

[snip]

> +void kunit_generic_try_catch_init(struct kunit_try_catch *try_catch)
> +{
> +	try_catch->run = kunit_generic_run_try_catch;
> +	try_catch->throw = kunit_generic_throw;
> +}

Same here. There's only one implementation of try_catch and I can't
really see any sensible justification for another implementation. Even
if there is, add the indirection when the second implementation is
added. This isn't C++ and we don't need to make everything a "method".

Thanks,

Logan
