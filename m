Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:54218 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758262AbYA2P5L (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jan 2008 10:57:11 -0500
Date: Tue, 29 Jan 2008 16:57:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: support for just "depends" is now gone?
Message-ID: <20080129155711.GA12762@uranus.ravnborg.org>
References: <alpine.LFD.1.00.0801290656450.28120@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.00.0801290656450.28120@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Tue, Jan 29, 2008 at 06:58:42AM -0500, Robert P. J. Day wrote:
> 
>   i'm just verifying that the current Kconfig parser no longer has
> support for simple "depends" directives, but only "depends on", right?
> and the alternative of "requires" is long since gone.

Correct - see
git log scripts/kconfig/zconf.gperf


	Sam
