Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:53434 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750910AbeBEGmo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 01:42:44 -0500
Message-ID: <1517812899.3118.372.camel@oracle.com>
Subject: Re: [PATCH v4 1/1] runchecks: Generalize make C={1,2} to support
 multiple checkers
From: Knut Omang <knut.omang@oracle.com>
Date: Mon, 05 Feb 2018 07:41:39 +0100
In-Reply-To: <c271ba8f99393585d69db71f40db3c01c44769e4.1516356501.git-series.knut.omang@oracle.com>
References: <cover.a7e2d48abd08947a9bb46ef5d18a8f33066cc40d.1516356501.git-series.knut.omang@oracle.com>
         <c271ba8f99393585d69db71f40db3c01c44769e4.1516356501.git-series.knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, =?ISO-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Tom Saeger <tom.saeger@oracle.com>, Michal Marek <michal.lkml@markovi.net>, =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Julia Lawall <Julia.Lawall@lip6.fr>, John Haxby <john.haxby@oracle.com>, =?ISO-8859-1?Q?=C5smund_=D8stvold?= <asmund.ostvold@oracle.com>, Matthew Wilcox <willy@infradead.org>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, cocci@systeme.lip6.fr, Andrew Morton <akpm@linux-foundation.org>

On Fri, 2018-01-19 at 11:14 +0100, Knut Omang wrote:
> Add scripts/runchecks which has generic support for running
> checker tools in a convenient and user friendly way that
> the author hopes can contribute to rein in issues detected
> by these tools in a manageable and convenient way.
> 
> scripts/runchecks provides the following basic functionality:
> 
> * Makes it possible to selectively suppress output from individual
>   checks on a per file or per subsystem basis.
> * Unifies output and suppression input from different tools
>   by providing a single unified syntax and presentation for the
>   underlying tools in the style of "scripts/checkpatch.pl --show-types".
> * Allows selective run of one, or more (or all) configured tools
>   for each file.
> 
> In the Makefile system, the sparse specific setup has been replaced
> by setup for runchecks.

Hi all,

- Anything more I can/need to do to bring this forward?
- Any quiet concerns?

I realize it is a subsystem crossing change, and a lot going on elsewhere, 
nevertheless I believe this is a time saver in the slightly longer run,
as it allows automation of checking, even without a "perfect"
code base to begin with.

Thanks,
Knut

