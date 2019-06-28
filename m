Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34405 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfF1Vhe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jun 2019 17:37:34 -0400
Date: Fri, 28 Jun 2019 21:37:31 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v5 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Message-ID: <20190628213731.GJ19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-18-brendanhiggins@google.com>
 <20190626021744.GU19023@42.do-not-panic.com>
 <CAAXuY3p+kVhjQ4LYtzormqVcH2vKu1abc_K9Z0XY=JX=bp8NcQ@mail.gmail.com>
 <20190627061021.GE19023@42.do-not-panic.com>
 <CAFd5g45VJ9yfuESUc=E0ydJyN+mk1b1kyHSCYvO2x9KPC7+3GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFd5g45VJ9yfuESUc=E0ydJyN+mk1b1kyHSCYvO2x9KPC7+3GQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Iurii Zaikin <yzaikin@google.com>, linux-api@vger.kernel.org, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, "Bird, Timothy" <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com

On Fri, Jun 28, 2019 at 01:01:54AM -0700, Brendan Higgins wrote:
> On Wed, Jun 26, 2019 at 11:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Jun 26, 2019 at 09:07:43PM -0700, Iurii Zaikin wrote:
> > > On Tue, Jun 25, 2019 at 7:17 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > > > > +static void sysctl_test_dointvec_table_maxlen_unset(struct kunit *test)
> > > > > +{
> > > > > +     struct ctl_table table = {
> > > > > +             .procname = "foo",
> > > > > +             .data           = &test_data.int_0001,
> > > > > +             .maxlen         = 0,
> > > > > +             .mode           = 0644,
> > > > > +             .proc_handler   = proc_dointvec,
> > > > > +             .extra1         = &i_zero,
> > > > > +             .extra2         = &i_one_hundred,
> > > > > +     };
> > > > > +     void  *buffer = kunit_kzalloc(test, sizeof(int), GFP_USER);
> > > > > +     size_t len;
> > > > > +     loff_t pos;
> > > > > +
> > > > > +     len = 1234;
> > > > > +     KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, 0, buffer, &len, &pos));
> > > > > +     KUNIT_EXPECT_EQ(test, (size_t)0, len);
> > > > > +     len = 1234;
> > > > > +     KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, 1, buffer, &len, &pos));
> > > > > +     KUNIT_EXPECT_EQ(test, (size_t)0, len);
> > > > > +}
> > > >
> > > > In a way this is also testing for general kernel API changes. This is and the
> > > > last one were good examples. So this is not just testing functionality
> > > > here. There is no wrong or write answer if 0 or -EINVAL was returned
> > > > other than the fact that we have been doing this for years.
> > > >
> > > > Its a perhaps small but important difference for some of these tests.  I
> > > > *do* think its worth clarifying through documentation which ones are
> > > > testing for API consistency Vs proper correctness.
> > >
> > > You make a good point that the test codifies the existing behavior of
> > > the function in lieu of formal documentation.  However, the test cases
> > > were derived from examining the source code of the function under test
> > > and attempting to cover all branches. The assertions were added only
> > > for the values that appeared to be set deliberately in the
> > > implementation. And it makes sense to me to test that the code does
> > > exactly what the implementation author intended.
> >
> > I'm not arguing against adding them. I'm suggesting that it is different
> > to test for API than for correctness of intended functionality, and
> > it would be wise to make it clear which test cases are for API and which
> > for correctness.
> 
> I see later on that some of the API stuff you are talking about is
> public APIs from the standpoint of user (outside of LInux) visible.

Right, UAPI.

> To
> be clear, is that what you mean by public APIs throughout, or would
> you distinguish between correctness tests, internal API tests, and
> external API tests?

I would definitely recommend distingishing between all of these.
Kernel API (or just call it API), UAPI, and correctness.

> > This will come up later for other kunit tests and it would be great
> > to set precendent so that other kunit tests can follow similar
> > practices to ensure its clear what is API realted Vs correctness of
> > intended functionality.
> >
> > In fact, I'm not yet sure if its possible to test public kernel API to
> > userspace with kunit, but if it is possible... well, that could make
> > linux-api folks happy as they could enable us to codify interpreation of
> > what is expected into kunit test cases, and we'd ensure that the
> > codified interpretation is not only documented in man pages but also
> > through formal kunit test cases.
> >
> > A regression in linux-api then could be formalized through a proper
> > kunit tests case. And if an API evolves, it would force developers to
> > update the respective kunit which codifies that contract.
> 
> Yep, I think that is long term hope. Some of the file system interface
> stuff that requires a filesystem to be mounted somewhere might get a
> little weird/difficult, but I suspect we should be able to do it
> eventually. I mean it's all just C code right? Should mostly boil down
> to someone figuring out how to do it the first time.

There used to be hacks in the kernel the call syscalls in a few places.
This was cleaned up and addressed via Dominik Brodowski's series last
year in March:

http://lkml.kernel.org/r/20180325162527.GA17492@light.dominikbrodowski.net

An example commit: d300b610812f3 ("kernel: use kernel_wait4() instead of
sys_wait4()").

So it would seem the work is done, and you'd just have to use the
respective exposed kernel_syscallname() calls, or add some if you
want to test a specific syscall in kernel space.

  Luis
