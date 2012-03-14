Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:52854 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030816Ab2CNNVw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Mar 2012 09:21:52 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Inconsistent kallsyms data on ARM.
Date: Wed, 14 Mar 2012 13:21:46 +0000
References: <CAP=VYLoStscdVJretZ-Rkbp7V3Vsm8N0oWcjih7ruHFiDN7CiA@mail.gmail.com>
In-Reply-To: <CAP=VYLoStscdVJretZ-Rkbp7V3Vsm8N0oWcjih7ruHFiDN7CiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201203141321.47010.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org

On Tuesday 13 March 2012, Paul Gortmaker wrote:
> This bug(?)  has been seen to float from one ARM build to another since
> I started tracking the day-to-day changes in Stephen's linux-next builds.
> 
> I see it was discussed earlier:
> 
>    https://lkml.org/lkml/2011/8/2/233
>    https://lkml.org/lkml/2011/10/8/70
> 
> but no concrete cause was nailed down.  Can the linux-next build results
> help shed some light on this in any way?  Since it seems sporadic, is
> there value in embedding a diagnostic of some sort in the infrastructure
> so that when the error is detected, that it prints out more detailed info?
> 
> I can provide links to failed linux-next builds, but at the moment, all they
> really seem to have is the same repeated error message, like this one:
> 
>    http://kisskb.ellerman.id.au/kisskb/buildresult/5869367/
> 
> and I don't see that helping folks all that much....
> 

I'm sure I can reproduce it if necessary, but I need to know what to
look for to find out what the problem is.

	Arnd
