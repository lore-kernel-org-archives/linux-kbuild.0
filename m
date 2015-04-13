Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:53405 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751575AbbDMWyO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 18:54:14 -0400
Date: Tue, 14 Apr 2015 00:54:12 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] Use -mcount-record for dynamic ftrace
Message-ID: <20150413225412.GK2366@two.firstfloor.org>
References: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
 <20150413153212.131fabc1@gandalf.local.home>
 <20150413215508.GW15335@tassilo.jf.intel.com>
 <20150413180347.6bfc0d5c@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150413180347.6bfc0d5c@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andi Kleen <ak@linux.intel.com>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

> > > I wonder who's responsible for
> > > https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/
> > > 
> > > If they can add a i386/x86_64 build for gcc5 I'll be happy to download
> > > it and test this patch.
> > 
> > That doesn't make any sense.
> > 
> 
> What, adding gcc5 to the crosstools suite? Why not?

Making patches dependent on someone else building compilers for you.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
