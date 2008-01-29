Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:36281 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753292AbYA2Mie (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jan 2008 07:38:34 -0500
Date: Tue, 29 Jan 2008 14:39:02 +0200
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: support for just "depends" is now gone?
Message-ID: <20080129123902.GE4398@does.not.exist>
References: <alpine.LFD.1.00.0801290656450.28120@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
>...

Both were removed in commit 247537b9a270b52cc0375adcb0fb2605a160cba5

> rday

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

