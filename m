Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbfHMEjB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 00:39:01 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190812182421.141150-15-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com> <20190812182421.141150-15-brendanhiggins@google.com>
Subject: Re: [PATCH v12 14/18] kunit: defconfig: add defconfigs for building KUnit tests
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 12 Aug 2019 21:38:58 -0700
Message-Id: <20190813043859.661F82054F@mail.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>

Quoting Brendan Higgins (2019-08-12 11:24:17)
> diff --git a/arch/um/configs/kunit_defconfig b/arch/um/configs/kunit_defc=
onfig
> new file mode 100644
> index 0000000000000..bfe49689038f1
> --- /dev/null
> +++ b/arch/um/configs/kunit_defconfig
> @@ -0,0 +1,8 @@
> +CONFIG_OF=3Dy
> +CONFIG_OF_UNITTEST=3Dy
> +CONFIG_OF_OVERLAY=3Dy
> +CONFIG_I2C=3Dy
> +CONFIG_I2C_MUX=3Dy
> +CONFIG_KUNIT=3Dy
> +CONFIG_KUNIT_TEST=3Dy
> +CONFIG_KUNIT_EXAMPLE_TEST=3Dy
> diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing=
/kunit/configs/all_tests.config
> new file mode 100644
> index 0000000000000..bfe49689038f1
> --- /dev/null
> +++ b/tools/testing/kunit/configs/all_tests.config
> @@ -0,0 +1,8 @@
> +CONFIG_OF=3Dy
> +CONFIG_OF_UNITTEST=3Dy
> +CONFIG_OF_OVERLAY=3Dy
> +CONFIG_I2C=3Dy
> +CONFIG_I2C_MUX=3Dy

Are these above config options necessary? I don't think they're part of
the patch series anymore so it looks odd to enable the OF unittests and
i2c configs.

> +CONFIG_KUNIT=3Dy
> +CONFIG_KUNIT_TEST=3Dy
> +CONFIG_KUNIT_EXAMPLE_TEST=3Dy
