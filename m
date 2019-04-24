Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33974 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbfDXS6Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Apr 2019 14:58:25 -0400
Date: Wed, 24 Apr 2019 14:58:14 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
Subject: Re: [PATCH v1 14/17] Documentation: kunit: add documentation for
 KUnit
Message-ID: <20190424185813.xabwr4lt6aunvpsd@gabell>
References: <20190404220652.19765-1-brendanhiggins@google.com>
 <20190404220652.19765-15-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190404220652.19765-15-brendanhiggins@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: corbet@lwn.net, frowand.list@gmail.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, shuah@kernel.org, yamada.masahiro@socionext.com, pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com, dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com, Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, joel@jms.id.au, jdike@addtoit.com, dan.carpenter@oracle.com, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com, richard@nod.at, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch, mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org

Hi Brendan,

KUNIT_ASSERT_NOT_ERR_OR_NULL() should be replaced to
KUNIT_EXPECT_NOT_ERR_OR_NULL(), right?

On Thu, Apr 04, 2019 at 03:06:49PM -0700, Brendan Higgins wrote:
> Add documentation for KUnit, the Linux kernel unit testing framework.
> - Add intro and usage guide for KUnit
> - Add API reference
> 
> Signed-off-by: Felix Guo <felixguoxiuping@gmail.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---

<snip>

> diff --git a/Documentation/kunit/start.rst b/Documentation/kunit/start.rst
> new file mode 100644
> index 0000000000000..5cdba5091905e
> --- /dev/null
> +++ b/Documentation/kunit/start.rst

<snip>

> +Assertions
> +~~~~~~~~~~
> +
> +KUnit also has the concept of an *assertion*. An assertion is just like an
> +expectation except the assertion immediately terminates the test case if it is
> +not satisfied.
> +
> +For example:
> +
> +.. code-block:: c
> +
> +	static void mock_test_do_expect_default_return(struct kunit *test)
> +	{
> +		struct mock_test_context *ctx = test->priv;
> +		struct mock *mock = ctx->mock;
> +		int param0 = 5, param1 = -5;
> +		const char *two_param_types[] = {"int", "int"};
> +		const void *two_params[] = {&param0, &param1};
> +		const void *ret;
> +
> +		ret = mock->do_expect(mock,
> +				      "test_printk", test_printk,
> +				      two_param_types, two_params,
> +				      ARRAY_SIZE(two_params));

> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ret);

		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, ret);

> +		KUNIT_EXPECT_EQ(test, -4, *((int *) ret));
> +	}
> +
> +In this example, the method under test should return a pointer to a value, so
> +if the pointer returned by the method is null or an errno, we don't want to
> +bother continuing the test since the following expectation could crash the test

> +case. `ASSERT_NOT_ERR_OR_NULL(...)` allows us to bail out of the test case if

  +case. `KUNIT_EXPECT_NOT_ERR_OR_NULL(...)` allows us to bail out of the test case if

Thanks!
Masa
