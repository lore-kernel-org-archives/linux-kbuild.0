Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:55804 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbdLRNmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Dec 2017 08:42:37 -0500
Message-ID: <1513604483.22938.65.camel@oracle.com>
Subject: Re: [PATCH v2 0/5] Support for generalized use of make C={1,2} via
 a wrapper program
From: Knut Omang <knut.omang@oracle.com>
Date: Mon, 18 Dec 2017 14:41:23 +0100
In-Reply-To: <20171218050043.GA1307@ziepe.ca>
References: <cover.630ac8faeeda67bf7a778c158174422042942d08.1513430008.git-series.knut.omang@oracle.com>
         <20171216094745.5e41ac51@xeon-e3> <1513476850.31439.108.camel@oracle.com>
         <20171218050043.GA1307@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Stephen Hemminger <stephen@networkplumber.org>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Jonathan Corbet <corbet@lwn.net>, Santosh Shilimkar <santosh.shilimkar@oracle.com>, Matthew Wilcox <willy@infradead.org>, cocci@systeme.lip6.fr, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org, Doug Ledford <dledford@redhat.com>, =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Shuah Khan <shuah@kernel.org>, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, John Haxby <john.haxby@oracle.com>, =?ISO-8859-1?Q?=C5smund_=D8stvold?= <asmund.ostvold@oracle.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "David S. Miller" <davem@davemloft.net>, Joe Perches <joe@perches.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, =?ISO-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>, Andy Whitcroft <apw@canonical.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>

On Sun, 2017-12-17 at 22:00 -0700, Jason Gunthorpe wrote:
> On Sun, Dec 17, 2017 at 03:14:10AM +0100, Knut Omang wrote:
> 
> > > I like the ability to add more checkers and keep then in the main
> > > upstream tree. But adding overrides for specific subsystems goes against
> > > the policy that all subsystems should be treated equally.
> > 
> > This is a tool to enable automated testing for as many checks as
> > possible, as soon as possible. Like any tool, it can be misused, but
> > that's IMHO an orthogonal problem that I think the maintainers will
> > be more than capable of preventing.
> > 
> > Think of this as a tightening screw: We eliminate errors class by
> > class or file by file, and in the same commit narrows in the list of
> > exceptions. That way we can fix issues piece by piece while avoiding
> > a lot of regressions in already clean parts.
> 
> Since you used drivers/infiniband as an example for this script..
> 
> I will say I agree with this idea.

> It is not that we *want* infiniband to be different from the rest of
> the kernel, it is that we have this historical situation where we
> don't have a code base that already passes the various static checker
> things.

I poked around trying make M= in different parts of the kernel to get some 
"mileage" and to get as much examples as possible, and it appears most of 
the kernel has issues of sorts. Also Joe and others keep adding more checks 
as well, and we'd want that process to coexist with the need for automatic 
regression testing in this area.

> I would like it very much if I could run 'make static checker' and see
> no warnings. 

which is just what is the result with 'make C=2 M=drivers/infiniband/core' 
and the patches #1 and #5 in this set in case not everyone got the point,

> This helps me know that I when I accept patches I am not
> introducing new problems to code that has already been cleaned up.
> 
> Today when we run checkers we get so many warnings it is too hard to
> make any sense of it.
> 
> Being able to say File X is now clean for check XYZ seems very useful
> and may motivate people to clean up the files they actualy care
> about...
> 
> > > There was discussion at Kernel Summit about how the different
> > > subsystems already have different rules. This appears to be a way
> > > to make that worse.
> > 
> > IMHO this is a tool that should help maintainers implement the
> > policies they desire.  But the tool itself does not dictate any
> > such.
> 
> Yes, again, in infiniband we like to see checkpatch be good for new
> submission, even if that clashes with surrounding code. For instance
> we have a mixture of sizeof foo and sizeof(foo) styles in the same
> file/function now.

That's one of the fixes that the excellent --fix-inplace handles so 
one of my patches here

https://github.com/torvalds/linux/compare/master...knuto:runchecks

fixes those in drivers/infiniband/core.

> I certainly don't want to tell people they need to follow some
> different style from 10 years ago when they send patches.
> 

Thanks,
Knut

> Jason
