Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34600 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937536AbdLRRqP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Dec 2017 12:46:15 -0500
Received: by mail-wr0-f196.google.com with SMTP id y21so15045788wrc.1
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Dec 2017 09:46:14 -0800 (PST)
Date: Mon, 18 Dec 2017 10:46:04 -0700
From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 0/5] Support for generalized use of make C={1,2} via a
 wrapper program
Message-ID: <20171218174604.GA19056@ziepe.ca>
References: <cover.630ac8faeeda67bf7a778c158174422042942d08.1513430008.git-series.knut.omang@oracle.com>
 <20171216094745.5e41ac51@xeon-e3>
 <1513476850.31439.108.camel@oracle.com>
 <20171218050043.GA1307@ziepe.ca>
 <1513576817.31581.58.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513576817.31581.58.camel@perches.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Knut Omang <knut.omang@oracle.com>, Stephen Hemminger <stephen@networkplumber.org>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Jonathan Corbet <corbet@lwn.net>, Santosh Shilimkar <santosh.shilimkar@oracle.com>, Matthew Wilcox <willy@infradead.org>, cocci@systeme.lip6.fr, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org, Doug Ledford <dledford@redhat.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Shuah Khan <shuah@kernel.org>, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, John Haxby <john.haxby@oracle.com>, =?utf-8?Q?=C3=85smund_=C3=98stvold?= <asmund.ostvold@oracle.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, =?utf-8?B?SMOla29u?= Bugge <haakon.bugge@oracle.com>, Andy Whitcroft <apw@canonical.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>

On Sun, Dec 17, 2017 at 10:00:17PM -0800, Joe Perches wrote:

> > Today when we run checkers we get so many warnings it is too hard to
> > make any sense of it.
> 
> Here is a list of the checkpatch messages for drivers/infiniband
> sorted by type.
> 
> Many of these might be corrected by using
> 
> $ ./scripts/checkpatch.pl -f --fix-inplace --types=<TYPE> \
>   $(git ls-files drivers/infiniband/)

How many of these do you think it is worth to fix?

We do get a steady trickle of changes in this topic every cycle.

Is it better to just do a big number of them all at once? Do you have
an idea how disruptive this kind of work is to the whole patch flow
eg new patches no longer applying to for-next, backports no longer
applying, merge conflicts?

Jason
