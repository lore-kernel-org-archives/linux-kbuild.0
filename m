Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:34962 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861AbaFFNZ6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Jun 2014 09:25:58 -0400
Date: Fri, 6 Jun 2014 15:25:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/5] kbuild: Clean-up and bug fixes of
 scripts/Makefile.host
Message-ID: <20140606132553.GA4961@ravnborg.org>
References: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

On Fri, Jun 06, 2014 at 10:30:58AM +0900, Masahiro Yamada wrote:
> 
> Masahiro Yamada (5):
>   kbuild: fix a typo in scripts/Makefile.host
>   kbuild: fix a bug of C++ host program handling
>   kbuild: clean up scripts/Makefile.host
>   kbuild: clean-up and bug fix of scripts/Makefile.host
>   kbuild: create directory of .o files from shlib-objs notation

All bug-fixes looks good.
But rahter than fixing this please consider if
we can drop the features.

The shlib stuff is for example no longer used and should be deleted.
Do we have any host progrs where we need to create directories as
is fixed in these patches?
If not then rip it out too.

Anthing that can make all this simpler is good.

	Sam
