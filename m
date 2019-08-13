Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbfHMGCC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 02:02:02 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190812182421.141150-14-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com> <20190812182421.141150-14-brendanhiggins@google.com>
Subject: Re: [PATCH v12 13/18] kunit: tool: add Python wrappers for running KUnit tests
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 12 Aug 2019 23:02:00 -0700
Message-Id: <20190813060201.9658A206C2@mail.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, Felix Guo <felixguoxiuping@gmail.com>, Brendan Higgins <brendanhiggins@google.com>

Quoting Brendan Higgins (2019-08-12 11:24:16)
> From: Felix Guo <felixguoxiuping@gmail.com>
>=20
> The ultimate goal is to create minimal isolated test binaries; in the
> meantime we are using UML to provide the infrastructure to run tests, so
> define an abstract way to configure and run tests that allow us to
> change the context in which tests are built without affecting the user.
> This also makes pretty and dynamic error reporting, and a lot of other
> nice features easier.
>=20
> kunit_config.py:
>   - parse .config and Kconfig files.
>=20
> kunit_kernel.py: provides helper functions to:
>   - configure the kernel using kunitconfig.
>   - build the kernel with the appropriate configuration.
>   - provide function to invoke the kernel and stream the output back.
>=20
> kunit_parser.py: parses raw logs returned out by kunit_kernel and
> displays them in a user friendly way.
>=20
> test_data/*: samples of test data for testing kunit.py, kunit_config.py,
> etc.
>=20
> Signed-off-by: Felix Guo <felixguoxiuping@gmail.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

I look forward to the single binary solution, but until then, we have
this.
