Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35975 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937671AbdLRRtU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Dec 2017 12:49:20 -0500
Received: by mail-wm0-f66.google.com with SMTP id b76so30946999wmg.1
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Dec 2017 09:49:20 -0800 (PST)
Date: Mon, 18 Dec 2017 10:49:10 -0700
From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 0/5] Support for generalized use of make C={1,2} via a
 wrapper program
Message-ID: <20171218174910.GB19056@ziepe.ca>
References: <cover.630ac8faeeda67bf7a778c158174422042942d08.1513430008.git-series.knut.omang@oracle.com>
 <20171216094745.5e41ac51@xeon-e3>
 <1513476850.31439.108.camel@oracle.com>
 <20171218050043.GA1307@ziepe.ca>
 <1513576817.31581.58.camel@perches.com>
 <1513602315.22938.49.camel@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513602315.22938.49.camel@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: Joe Perches <joe@perches.com>, Stephen Hemminger <stephen@networkplumber.org>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Jonathan Corbet <corbet@lwn.net>, Santosh Shilimkar <santosh.shilimkar@oracle.com>, Matthew Wilcox <willy@infradead.org>, cocci@systeme.lip6.fr, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org, Doug Ledford <dledford@redhat.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Shuah Khan <shuah@kernel.org>, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, John Haxby <john.haxby@oracle.com>, =?utf-8?Q?=C3=85smund_=C3=98stvold?= <asmund.ostvold@oracle.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, =?utf-8?B?SMOla29u?= Bugge <haakon.bugge@oracle.com>, Andy Whitcroft <apw@canonical.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>

On Mon, Dec 18, 2017 at 02:05:15PM +0100, Knut Omang wrote:
 
> https://github.com/torvalds/linux/compare/master...knuto:runchecks

Several of these to rdma/core do not look so big, you should think
about sending them..

Jason
