Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:52082 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1765463AbYD3UfN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Apr 2008 16:35:13 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Roland McGrath <roland@redhat.com>
Subject: Re: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
In-Reply-To: SL Baur's message of  Wednesday, 30 April 2008 13:32:52 -0700 <ed10ee420804301332n5fb72f3jb9bdea03aa313fad@mail.gmail.com>
References: <20080429183531.GB19652@uranus.ravnborg.org>
	<20080429172402.14d7d40b@ephemeral>
	<ed10ee420804300345r5d4566d2uff5c3f49f1c15107@mail.gmail.com>
	<20080430080134.60346a12.randy.dunlap@oracle.com>
	<ed10ee420804301332n5fb72f3jb9bdea03aa313fad@mail.gmail.com>
Message-Id: <20080430203510.AEE7426FA04@magilla.localdomain>
Date: Wed, 30 Apr 2008 13:35:10 -0700 (PDT)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SL Baur <steve@xemacs.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Andres Salomon <dilinger@queued.net>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@codemonkey.org.uk>

> Eg. `make K=HPxw4300.config ...' would have "-HPxw4300" appended
> to EXTRAVERSION.  Maybe this doesn't make sense any more, but it
> was once something I wanted very much.

We have "echo .foo > localversion" or CONFIG_LOCALVERSION=.foo for that.
Maybe what you would like is a variable on that make command line to
magically set CONFIG_LOCALVERSION with less typing.


Thanks,
Roland
