Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:56013 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S934085Ab1D2XA4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 19:00:56 -0400
Date: Fri, 29 Apr 2011 16:00:53 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH V2 0/7] kbuild: move scripts/basic/docproc.c to
 scripts/docproc.c
Message-Id: <20110429160053.bbe7c199.rdunlap@xenotime.net>
In-Reply-To: <20110429155915.f9059777.rdunlap@xenotime.net>
References: <4DBB3DD4.9000000@verizon.net>
	<20110429155915.f9059777.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: pefoley2@verizon.net, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Fri, 29 Apr 2011 15:59:15 -0700 Randy Dunlap wrote:

> On Fri, 29 Apr 2011 18:38:12 -0400 Peter Foley wrote:
> 
> > This patchset moves scripts/basic/docproc to scripts/docproc.
> > This causes docproc to only be built for *doc targets rather than every
> > time the kernel is compiled.
> > 
> > Patches also attached as requested by Michal Marek.
> 
> 
> Please test & fix when using O=output_dir.

Sorry, user error.  I missed applying patch 6/7.  :(

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
