Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36864 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfEBU0H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 May 2019 16:26:07 -0400
Received: by mail-ot1-f65.google.com with SMTP id r20so3346940otg.4
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2019 13:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com> <20190502110008.GC12416@kroah.com>
In-Reply-To: <20190502110008.GC12416@kroah.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 13:25:54 -0700
Message-ID: <CAFd5g47ssM7RQZxQsUJ86UigcF-Uz+Kwv2yvKN_gZK-TtW89bA@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream like logger
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, shuah@kernel.org, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, "Bird, Timothy" <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com

On Thu, May 2, 2019 at 4:00 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 01, 2019 at 04:01:13PM -0700, Brendan Higgins wrote:
> > A lot of the expectation and assertion infrastructure prints out fairly
> > complicated test failure messages, so add a C++ style log library for
> > for logging test results.
>
> Ideally we would always use a standard logging format, like the
> kselftest tests all are aiming to do.  That way the output can be easily
> parsed by tools to see if the tests succeed/fail easily.
>
> Any chance of having this logging framework enforcing that format as
> well?

I agree with your comment on the later patch that we should handle
this at the wrapper script layer (KUnit tool).
