Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46516 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfEBXpm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 May 2019 19:45:42 -0400
Received: by mail-oi1-f194.google.com with SMTP id d62so3061678oib.13
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2019 16:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com> <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com> <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
In-Reply-To: <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 16:45:29 -0700
Message-ID: <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, shuah@kernel.org, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, "Bird, Timothy" <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com, Felix Guo <felixguoxiuping@gmail.com>

On Thu, May 2, 2019 at 2:16 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 5/2/19 11:07 AM, Brendan Higgins wrote:
> > On Thu, May 2, 2019 at 4:02 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Wed, May 01, 2019 at 04:01:21PM -0700, Brendan Higgins wrote:
> >>> From: Felix Guo <felixguoxiuping@gmail.com>
> >>>
> >>> The ultimate goal is to create minimal isolated test binaries; in the
> >>> meantime we are using UML to provide the infrastructure to run tests, so
> >>> define an abstract way to configure and run tests that allow us to
> >>> change the context in which tests are built without affecting the user.
> >>> This also makes pretty and dynamic error reporting, and a lot of other
> >>> nice features easier.
> >>>
> >>> kunit_config.py:
> >>>   - parse .config and Kconfig files.
> >>>
> >>> kunit_kernel.py: provides helper functions to:
> >>>   - configure the kernel using kunitconfig.
> >>>   - build the kernel with the appropriate configuration.
> >>>   - provide function to invoke the kernel and stream the output back.
> >>>
> >>> Signed-off-by: Felix Guo <felixguoxiuping@gmail.com>
> >>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> >>
> >> Ah, here's probably my answer to my previous logging format question,
> >> right?  What's the chance that these wrappers output stuff in a standard
> >> format that test-framework-tools can already parse?  :)

To be clear, the test-framework-tools format we are talking about is
TAP13[1], correct?

My understanding is that is what kselftest is being converted to use.

> >
> > It should be pretty easy to do. I had some patches that pack up the
> > results into a serialized format for a presubmit service; it should be
> > pretty straightforward to take the same logic and just change the
> > output format.
>
> When examining and trying out the previous versions of the patch I found
> the wrappers useful to provide information about how to control and use
> the tests, but I had no interest in using the scripts as they do not
> fit in with my personal environment and workflow.
>
> In the previous versions of the patch, these helper scripts are optional,
> which is good for my use case.  If the helper scripts are required to

They are still optional.

> get the data into the proper format then the scripts are not quite so
> optional, they become the expected environment.  I think the proper
> format should exist without the helper scripts.

That's a good point. A couple things,

First off, supporting TAP13, either in the kernel or the wrapper
script is not hard, but I don't think that is the real issue that you
raise.

If your only concern is that you will always be able to have human
readable KUnit results printed to the kernel log, that is a guarantee
I feel comfortable making. Beyond that, I think it is going to take a
long while before I would feel comfortable guaranteeing anything about
how will KUnit work, what kind of data it will want to expose, and how
it will be organized. I think the wrapper script provides a nice
facade that I can maintain, can mediate between the implementation
details and the user, and can mediate between the implementation
details and other pieces of software that might want to consume
results.

[1] https://testanything.org/tap-version-13-specification.html
