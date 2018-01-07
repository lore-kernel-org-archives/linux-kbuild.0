Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:37485 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753322AbeAGMEi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jan 2018 07:04:38 -0500
Received: by mail-wr0-f170.google.com with SMTP id f8so8122848wre.4
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Jan 2018 04:04:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87vagg8jjw.fsf@intel.com>
References: <cover.5b56d020b8e826a7da33b1823c059acd0c123f8b.1515072782.git-series.knut.omang@oracle.com>
 <5f292b7effba0efcf4855bff83b7b9313ac45895.1515072782.git-series.knut.omang@oracle.com>
 <874lo1aait.fsf@intel.com> <1515096931.31439.647.camel@oracle.com> <87vagg8jjw.fsf@intel.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Sun, 7 Jan 2018 13:03:57 +0100
Message-ID: <CAOFm3uGCJmPiHF_tGVXSUXbiGyK2HP-0Ahfv7SS+dJrmnkc5WQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] runchecks: Generalize make C={1,2} to support
 multiple checkers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, John Haxby <john.haxby@oracle.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Julia Lawall <Julia.Lawall@lip6.fr>, =?UTF-8?B?SMOla29uIEJ1Z2dl?= <haakon.bugge@oracle.com>, =?UTF-8?B?w4VzbXVuZCDDmHN0dm9sZA==?= <asmund.ostvold@oracle.com>, Matthew Wilcox <willy@infradead.org>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, cocci@systeme.lip6.fr, linux-kbuild@vger.kernel.org

Knut,

On Fri, Jan 5, 2018 at 3:30 PM, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 04 Jan 2018, Knut Omang <knut.omang@oracle.com> wrote:
>> On Thu, 2018-01-04 at 17:50 +0200, Jani Nikula wrote:
>>> On Thu, 04 Jan 2018, Knut Omang <knut.omang@oracle.com> wrote:
>>> > Add scripts/runchecks which has generic support for running
>>> > checker tools in a convenient and user friendly way that
>>> > the author hopes can contribute to rein in issues detected
>>> > by these tools in a manageable and convenient way.

<snip>

>>> > --- /dev/null
>>> > +++ b/scripts/runchecks
>>> > @@ -0,0 +1,734 @@
>>> > +#!/usr/bin/python
>>> > +
>>> > +# SPDX-License-Identifier: GPL-2.0

Thank you for using an SPDX tag here ....  .

<snip>

>>> > +#
>>> > +# This program is free software; you can redistribute it and/or modify
>>> > +# it under the terms of the GNU General Public License version 2
>>> > +# as published by the Free Software Foundation.
>>> > +

....but then please DRY: do not add this extra legalese which is redundant.

-- 
Cordially
Philippe Ombredanne
