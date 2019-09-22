Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:42724 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387604AbfIVQ3U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Sep 2019 12:29:20 -0400
Subject: Re: [PATCH v17 07/19] kunit: test: add initial tests
References: <20190921001855.200947-1-brendanhiggins@google.com>
 <20190921001855.200947-8-brendanhiggins@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <944ac47d-1411-9ebd-d0d4-a616c88c9c20@infradead.org>
Date: Sun, 22 Sep 2019 09:28:28 -0700
MIME-Version: 1.0
In-Reply-To: <20190921001855.200947-8-brendanhiggins@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, torvalds@linux-foundation.org

On 9/20/19 5:18 PM, Brendan Higgins wrote:
> Add a test for string stream along with a simpler example.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  lib/kunit/Kconfig              | 25 ++++++++++
>  lib/kunit/Makefile             |  4 ++
>  lib/kunit/example-test.c       | 88 ++++++++++++++++++++++++++++++++++
>  lib/kunit/string-stream-test.c | 52 ++++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 lib/kunit/example-test.c
>  create mode 100644 lib/kunit/string-stream-test.c
> 
> diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
> index 666b9cb67a74..3868c226cf31 100644
> --- a/lib/kunit/Kconfig
> +++ b/lib/kunit/Kconfig
> @@ -11,3 +11,28 @@ menuconfig KUNIT
>  	  special hardware when using UML. Can also be used on most other
>  	  architectures. For more information, please see
>  	  Documentation/dev-tools/kunit/.
> +
> +if KUNIT

The 'if' above provides the dependency clause, so the 2 'depends on KUNIT'
below are not needed.  They are redundant.

> +
> +config KUNIT_TEST
> +	bool "KUnit test for KUnit"
> +	depends on KUNIT
> +	help
> +	  Enables the unit tests for the KUnit test framework. These tests test
> +	  the KUnit test framework itself; the tests are both written using
> +	  KUnit and test KUnit. This option should only be enabled for testing
> +	  purposes by developers interested in testing that KUnit works as
> +	  expected.
> +
> +config KUNIT_EXAMPLE_TEST
> +	bool "Example test for KUnit"
> +	depends on KUNIT
> +	help
> +	  Enables an example unit test that illustrates some of the basic
> +	  features of KUnit. This test only exists to help new users understand
> +	  what KUnit is and how it is used. Please refer to the example test
> +	  itself, lib/kunit/example-test.c, for more information. This option
> +	  is intended for curious hackers who would like to understand how to
> +	  use KUnit for kernel development.
> +
> +endif # KUNIT



-- 
~Randy
