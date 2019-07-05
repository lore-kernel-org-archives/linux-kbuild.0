Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37090 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfGEUUy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jul 2019 16:20:54 -0400
Date: Fri, 5 Jul 2019 20:20:51 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v6 01/18] kunit: test: add KUnit test runner core
Message-ID: <20190705202051.GB19023@42.do-not-panic.com>
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704003615.204860-2-brendanhiggins@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com

On Wed, Jul 03, 2019 at 05:35:58PM -0700, Brendan Higgins wrote:
> +struct kunit {
> +	void *priv;
> +
> +	/* private: internal use only. */
> +	const char *name; /* Read only after initialization! */
> +	bool success; /* Read only after test_case finishes! */
> +};

No lock attribute above.

> +void kunit_init_test(struct kunit *test, const char *name)
> +{
> +	spin_lock_init(&test->lock);
> +	test->name = name;
> +	test->success = true;
> +}

And yet here you initialize a spin lock... This won't compile. Seems
you forgot to remove this line. So I guess a re-spin is better.

  Luis
