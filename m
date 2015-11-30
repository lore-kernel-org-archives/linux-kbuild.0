Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e06smtp06.uk.ibm.com ([195.75.94.102]:36141 "EHLO
	e06smtp06.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753378AbbK3Iw5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Nov 2015 03:52:57 -0500
Received: from localhost
	by e06smtp06.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Mon, 30 Nov 2015 08:52:55 -0000
Date: Mon, 30 Nov 2015 09:52:51 +0100
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH 1/2] kbuild: add AFLAGS_REMOVE_(basename).o option
Message-ID: <20151130085251.GC4045@osiris>
References: <1448103599-6660-1-git-send-email-heiko.carstens@de.ibm.com>
 <1448103599-6660-2-git-send-email-heiko.carstens@de.ibm.com>
 <20151130081708.GA4045@osiris>
 <565C0A8D.2010900@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565C0A8D.2010900@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Mon, Nov 30, 2015 at 09:36:29AM +0100, Michal Marek wrote:
> >> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> >> index 79e86613712f..26a48d76eb9d 100644
> >> --- a/scripts/Makefile.lib
> >> +++ b/scripts/Makefile.lib
> >> @@ -104,8 +104,9 @@ modname_flags  = $(if $(filter 1,$(words $(modname))),\
> >>  orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(KBUILD_SUBDIR_CCFLAGS) \
> >>                   $(ccflags-y) $(CFLAGS_$(basetarget).o)
> >>  _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(basetarget).o), $(orig_c_flags))
> >> -_a_flags       = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(KBUILD_SUBDIR_ASFLAGS) \
> >> +orig_a_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(KBUILD_SUBDIR_ASFLAGS) \
> >>                   $(asflags-y) $(AFLAGS_$(basetarget).o)
> >> +_a_flags       = $(filter-out $(AFLAGS_REMOVE_$(basetarget).o), $(orig_a_flags))
> >>  _cpp_flags     = $(KBUILD_CPPFLAGS) $(cppflags-y) $(CPPFLAGS_$(@F))
> >>  
> >>  #
> > 
> > Hello Michal,
> > 
> > since I didn't hear anything from you, I'll simply add this to the s390 tree.
> > The patch should be trivial enough and is certainly not controversial.
> 
> Hi Heiko,
> 
> yes, please go ahead, the patch is fine.

Ok, thanks. I'll add your ack then.

