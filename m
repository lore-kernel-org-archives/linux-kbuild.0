Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:42564 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753783AbeAGNT6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jan 2018 08:19:58 -0500
Message-ID: <1515330822.31439.779.camel@oracle.com>
Subject: Re: [PATCH v3 1/1] runchecks: Generalize make C={1,2} to support
 multiple checkers
From: Knut Omang <knut.omang@oracle.com>
Date: Sun, 07 Jan 2018 14:13:42 +0100
In-Reply-To: <CAOFm3uGCJmPiHF_tGVXSUXbiGyK2HP-0Ahfv7SS+dJrmnkc5WQ@mail.gmail.com>
References: <cover.5b56d020b8e826a7da33b1823c059acd0c123f8b.1515072782.git-series.knut.omang@oracle.com>
         <5f292b7effba0efcf4855bff83b7b9313ac45895.1515072782.git-series.knut.omang@oracle.com>
         <874lo1aait.fsf@intel.com> <1515096931.31439.647.camel@oracle.com>
         <87vagg8jjw.fsf@intel.com>
         <CAOFm3uGCJmPiHF_tGVXSUXbiGyK2HP-0Ahfv7SS+dJrmnkc5WQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, John Haxby <john.haxby@oracle.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Julia Lawall <Julia.Lawall@lip6.fr>, =?ISO-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>, =?ISO-8859-1?Q?=C5smund_=D8stvold?= <asmund.ostvold@oracle.com>, Matthew Wilcox <willy@infradead.org>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, cocci@systeme.lip6.fr, linux-kbuild@vger.kernel.org

On Sun, 2018-01-07 at 13:03 +0100, Philippe Ombredanne wrote:
> Knut,
> 
> On Fri, Jan 5, 2018 at 3:30 PM, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Thu, 04 Jan 2018, Knut Omang <knut.omang@oracle.com> wrote:
> >> On Thu, 2018-01-04 at 17:50 +0200, Jani Nikula wrote:
> >>> On Thu, 04 Jan 2018, Knut Omang <knut.omang@oracle.com> wrote:
> >>> > Add scripts/runchecks which has generic support for running
> >>> > checker tools in a convenient and user friendly way that
> >>> > the author hopes can contribute to rein in issues detected
> >>> > by these tools in a manageable and convenient way.
> 
> <snip>
> 
> >>> > --- /dev/null
> >>> > +++ b/scripts/runchecks
> >>> > @@ -0,0 +1,734 @@
> >>> > +#!/usr/bin/python
> >>> > +
> >>> > +# SPDX-License-Identifier: GPL-2.0
> 
> Thank you for using an SPDX tag here ....  .
> 
> <snip>
> 
> >>> > +#
> >>> > +# This program is free software; you can redistribute it and/or modify
> >>> > +# it under the terms of the GNU General Public License version 2
> >>> > +# as published by the Free Software Foundation.
> >>> > +
> 
> ....but then please DRY: do not add this extra legalese which is redundant.

Ah, I see - just trying to be compliant in all dimensions
 - will fix,

Thanks,
Knut
