Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:26727 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757237AbcBSRG3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Feb 2016 12:06:29 -0500
From: Ian Jackson <Ian.Jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <22215.19335.684167.840646@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2016 17:06:15 +0000
Subject: Re: Adding Xen to the kbuild bot?
In-Reply-To: <CALCETrVssJ2oCqT9eKzoXQ0VWz1O1XB=Gt97djrgPYTfZYt_ug@mail.gmail.com>
References: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
	<20160205031116.GB30154@wfg-t540p.sh.intel.com>
	<CALCETrVssJ2oCqT9eKzoXQ0VWz1O1XB=Gt97djrgPYTfZYt_ug@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Fengguang Wu <fengguang.wu@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Ian Campbell <ian.campbell@citrix.com>, LKP <lkp@01.org>, "Hu, Robert" <robert.hu@intel.com>

Andy Lutomirski writes ("Re: Adding Xen to the kbuild bot?"):
> On Feb 4, 2016 7:11 PM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:
> > Do you mean to run basic Xen testing on the various kernel trees that
> > 0day robot covers? That is, to catch kernel regressions when running
> > under Xen.

This would be great.

> > If the intention is to catch Xen regressions, the OSStest
> > infrastructure may be a better option:
> >
> >         git://xenbits.xen.org/osstest.git
> 
> No, I think that 0day should pick one Xen version and stick with it
> for a while rather than trying to track the latest version.

I don't have an opinion about whether more kernel testing for Xen
problems should be done with 0day or with wider use of osstest.

In any case, we in the Xen Project have a number of git branches of
Xen which might well suitable for use as a stable input to something
like 0day.

The most obvious would be the osstest output branch for the latest Xen
stable release, which is at
   git://xenbits.xen.org/osstest.git#stable-4.6
(and when 4.7 is released, ...-4.7).  This is subjected to the osstest
push gate so it is known not to be totally broken.

There is also the tested upstream development branch:
   git://xenbits.xen.org/osstest.git#master
which is also the output of an osstest push gate.  The advantage of
using that is that there is no need to explicitly update to a new
Xen release; the disadvantage is that it does change continously.

But both of these have been tested with at least one (usually, older)
version of Linux as dom0 and known to boot a variety of guests.

Ian.
