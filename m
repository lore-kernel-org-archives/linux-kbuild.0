Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0037.hostedemail.com ([216.40.44.37]:48710 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752746AbdLPSCl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Dec 2017 13:02:41 -0500
Message-ID: <1513447353.4647.39.camel@perches.com>
Subject: Re: [PATCH v2 0/5] Support for generalized use of make C={1,2} via
 a wrapper program
From: Joe Perches <joe@perches.com>
Date: Sat, 16 Dec 2017 10:02:33 -0800
In-Reply-To: <20171216094745.5e41ac51@xeon-e3>
References: <cover.630ac8faeeda67bf7a778c158174422042942d08.1513430008.git-series.knut.omang@oracle.com>
         <20171216094745.5e41ac51@xeon-e3>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Hemminger <stephen@networkplumber.org>, Knut Omang <knut.omang@oracle.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Jonathan Corbet <corbet@lwn.net>, Santosh Shilimkar <santosh.shilimkar@oracle.com>, Matthew Wilcox <willy@infradead.org>, cocci@systeme.lip6.fr, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org, Doug Ledford <dledford@redhat.com>, =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Shuah Khan <shuah@kernel.org>, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, John Haxby <john.haxby@oracle.com>, =?ISO-8859-1?Q?=C5smund_=D8stvold?= <asmund.ostvold@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, =?ISO-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>, Andy Whitcroft <apw@canonical.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>

On Sat, 2017-12-16 at 09:47 -0800, Stephen Hemminger wrote:
> On Sat, 16 Dec 2017 15:42:25 +0100
> Knut Omang <knut.omang@oracle.com> wrote:
> 
> > This patch series implements features to make it easier to run checkers on the
> > entire kernel as part of automatic and developer testing.
> > 
> > This is done by replacing the sparse specific setup for the C={1,2} variable
> > in the makefiles with setup for running scripts/runchecks, a new program that
> > can run any number of different "checkers". The behaviour of runchecks is
> > defined by simple "global" configuration in scripts/runchecks.cfg which can be
> > extended by local configuration applying to individual files, directories or
> > subtrees in the source.
[]
> I like the ability to add more checkers and keep then in the main
> upstream tree. But adding overrides for specific subsystems goes against
> the policy that all subsystems should be treated equally.
> 
> There was discussion at Kernel Summit about how the different
> subsystems already have different rules. This appears to be a
> way to make that worse.

I think that's OK and somewhat reasonable.

What is perhaps unreasonable is requiring subsystems with
a local specific style to change to some universal style.

see comments like:

https://lkml.org/lkml/2017/12/11/689
