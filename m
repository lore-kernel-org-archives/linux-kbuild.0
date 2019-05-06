Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39039 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbfEFJEC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 05:04:02 -0400
Received: by mail-oi1-f193.google.com with SMTP id x16so3095856oic.6
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2019 02:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-12-brendanhiggins@google.com> <8c37fd20-859c-9c34-4465-8adfcfdaab09@kernel.org>
In-Reply-To: <8c37fd20-859c-9c34-4465-8adfcfdaab09@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 6 May 2019 02:03:49 -0700
Message-ID: <CAFd5g44q3qyahykujDzOoO01DwGMUm+Kce-tOAzSW90U4mQM7w@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] kunit: test: add test managed resource tests
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shuah <shuah@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, "Bird, Timothy" <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com, Avinash Kondareddy <akndr41@gmail.com>

On Fri, May 3, 2019 at 7:34 AM shuah <shuah@kernel.org> wrote:
>
> On 5/1/19 5:01 PM, Brendan Higgins wrote:
> > From: Avinash Kondareddy <akndr41@gmail.com>
> >
> > Tests how tests interact with test managed resources in their lifetime.
> >
> > Signed-off-by: Avinash Kondareddy <akndr41@gmail.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
>
> I think this change log could use more details. It is vague on what it
> does.

Agreed. Will fix in next revision.
