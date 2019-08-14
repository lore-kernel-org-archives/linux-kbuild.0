Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729276AbfHNRXC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 13:23:02 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFd5g45NdQEcP0JQpZc3HYYgNZfsBsHL+ByXRK+OupWObwMuqg@mail.gmail.com>
References: <20190814055108.214253-1-brendanhiggins@google.com> <CAFd5g45NdQEcP0JQpZc3HYYgNZfsBsHL+ByXRK+OupWObwMuqg@mail.gmail.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit testing framework
From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 14 Aug 2019 10:23:00 -0700
Message-Id: <20190814172301.9246520665@mail.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Theodore Ts'o <tytso@mit.edu>, shuah <shuah@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, "Bird, Timothy" <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>

Quoting Brendan Higgins (2019-08-14 03:03:47)
> On Tue, Aug 13, 2019 at 10:52 PM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > ## TL;DR
> >
> > This revision addresses comments from Stephen and Bjorn Helgaas. Most
> > changes are pretty minor stuff that doesn't affect the API in anyway.
> > One significant change, however, is that I added support for freeing
> > kunit_resource managed resources before the test case is finished via
> > kunit_resource_destroy(). Additionally, Bjorn pointed out that I broke
> > KUnit on certain configurations (like the default one for x86, whoops).
> >
> > Based on Stephen's feedback on the previous change, I think we are
> > pretty close. I am not expecting any significant changes from here on
> > out.
>=20
> Stephen, it looks like you have just replied with "Reviewed-bys" on
> all the remaining emails that you looked at. Is there anything else
> that we are missing? Or is this ready for Shuah to apply?
>=20

I think it's good to go! Thanks for the persistence.
