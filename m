Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:32880 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760150Ab3EBQMl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 May 2013 12:12:41 -0400
Message-ID: <51829070.4070305@zytor.com>
Date: Thu, 02 May 2013 09:12:32 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Silent failure when missing bc
References: <20130502144403.GE6335@pomac.netswarm.net>
In-Reply-To: <20130502144403.GE6335@pomac.netswarm.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Kumlien <pomac@vapor.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz

On 05/02/2013 07:44 AM, Ian Kumlien wrote:
> Hi, 
> 
> A dependency on bc was added at some point during the 3.9 development.
> 
> My machines runs a git forest which contains both stable and Torvalds
> mainline. So any kernel version is only a:
> 	git fetch --all && git checkout <tag> away
> 
> When switching from v3.8.5 to v3.9-rc7 i ran in to a odd thing.
> 
> It seemed to build fine, make install and modules_install was all fine
> as well but rebooting revealed that 3.8.5 had been installed again
> instead.
> 

Are you *sure* that the build didn't stop and you just didn't notice it?
 That is what the above sounds like.  Keep in mind that in a parallel
build there can be quite a few lines of output after the *** failure line...

> Doing make clean and rebuilding revealed that I was missing bc ;)
> 
> I have tried to find exactly where it's run since then, i have found the
> cmd_bc section but not found what triggers it... Due to lack of time and
> energy, I hearby report this bug!
> 
> This is about as far as i got:
> kernel/Makefile:135:quiet_cmd_bc  = BC      $@
> kernel/Makefile:136:      cmd_bc  = bc -q $(filter-out FORCE,$^) > $@
> 
> Is there any detaled information and or instructions on kbuild btw?
> 

The disconcerting thing here, of course, is if the build would have
looked like it completed without the file actually being generated.  It
should have failed either to generate the file, or it should have
produced an empty header which would have caused a failure further down
the line...

	-hpa

