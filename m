Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:33549 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756428Ab0BBVZF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Feb 2010 16:25:05 -0500
Subject: Re: 2.6.3(2|3): scripts/kconfig/streamline_config.pl :Malfunction
From: Steven Rostedt <rostedt@goodmis.org>
Reply-To: rostedt@goodmis.org
In-Reply-To: <E1NcEQ2-0006Bh-DP@www5.emo.freenet-rz.de>
References: <E1NcEQ2-0006Bh-DP@www5.emo.freenet-rz.de>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 02 Feb 2010 16:25:03 -0500
Message-ID: <1265145903.29013.1277.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: patrick_@freenet.de
Cc: linux-kbuild@vger.kernel.org

On Tue, 2010-02-02 at 09:47 +0100, patrick_@freenet.de wrote:
> Hello Steven,
> 
> I havnt heard from you since I first encountered severe functionality issues with your streamline_config.pl script in December. and 2.6.32. According to the changelog you haven't touched it since either.
> 
> I just retried it with 2.6.33-rc6 (before I have rechecked the changelog and seen you didn't touch it at all) but it's even worse (on THIS machine) .. it will not recognize any standard modules at all:
> 
> (just pasting an excerpt)
> 
> scsi_mod config not found!!
> binfmt_misc config not found!!
> i2c_core config not found!!
> button config not found!!
> raid10 config not found!!
> 
> .. I am using debian lenny's config ... the bug I encountered last time (on another machine, with different hardware) still persists though.
> 
> (see http://markmail.org/message/lmvzqjyzx6qongwc )
> 
> I attached the output of lsmod as well as the config in question.
> 
> 
> PS: if you need a helping hand with this, let me know (I havnt looked into your script yet, but as I explained before I sort of wrote something similar with a lot of tracking and bash magic and it works, but its mainly dirty hacks).
> 

Can you try to see if this kernel works. I'll be pushing this to Linus
for 34.

git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-kconfig.git

Test out the for-linus-2 branch.

-- Steve


