Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.230]:18568 "EHLO
	cdptpa-oedge-vip.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751951AbbDNA0P (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 20:26:15 -0400
Date: Mon, 13 Apr 2015 20:26:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] Use -mcount-record for dynamic ftrace
Message-ID: <20150413202620.31745006@grimm.local.home>
In-Reply-To: <20150413225412.GK2366@two.firstfloor.org>
References: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
	<20150413153212.131fabc1@gandalf.local.home>
	<20150413215508.GW15335@tassilo.jf.intel.com>
	<20150413180347.6bfc0d5c@gandalf.local.home>
	<20150413225412.GK2366@two.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

On Tue, 14 Apr 2015 00:54:12 +0200
Andi Kleen <andi@firstfloor.org> wrote:

> > > > I wonder who's responsible for
> > > > https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/
> > > > 
> > > > If they can add a i386/x86_64 build for gcc5 I'll be happy to download
> > > > it and test this patch.
> > > 
> > > That doesn't make any sense.
> > > 
> > 
> > What, adding gcc5 to the crosstools suite? Why not?
> 
> Making patches dependent on someone else building compilers for you.
> 

Well, until it's in the distro, I don't currently have time to build
the compiler. Thus, it will have to wait till one's already available,
or I get around to it.

-- Steve
