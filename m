Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:54912 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755584Ab0G2JQv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 05:16:51 -0400
Date: Thu, 29 Jul 2010 11:16:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: How to access if/endif dependencies programmatically?
Message-ID: <20100729091650.GA6085@merkur.ravnborg.org>
References: <AANLkTim9b=n7CvnSJhwDrE_HrnJOJ0H=EpOkGBvJt1CC@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTim9b=n7CvnSJhwDrE_HrnJOJ0H=EpOkGBvJt1CC@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: kbuild <linux-kbuild@vger.kernel.org>

On Thu, Jul 29, 2010 at 11:01:43AM +0200, Vegard Nossum wrote:
> Hi,
> 
> Consider the following kconfig fragment:
> 
> config A
> 
> if A
> config B
> endif

The dependencies control the visibility.
The try to explain this consider this adopted
Kconfig file fragment:

config A
	bool "A"

config B
	bool "B"

if A
config B
	prompt "BB"
endif


See how B shows up in two places with different dependencies.
Therefore dependencies are an attribute of the menu - not the symbol.

So to properly inspect dependencies you need to traverse the menus,
not the symbols as they may be used in several places.

	Sam
