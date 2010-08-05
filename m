Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:31939 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab0HEREY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Aug 2010 13:04:24 -0400
Date: Thu, 5 Aug 2010 10:04:08 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] nconfig: add search support
Message-Id: <20100805100408.5b724047.randy.dunlap@oracle.com>
In-Reply-To: <1280838492-9942-1-git-send-email-nir.tzachar@gmail.com>
References: <AANLkTimyDwWtLbc682rW-QORjU0+r+txZO-iKAini1H1@mail.gmail.com>
	<1280838492-9942-1-git-send-email-nir.tzachar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nir.tzachar@gmail.com
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, sam@ravnborg.org, randy.dunlap@oracle.com

On Tue,  3 Aug 2010 15:28:12 +0300 nir.tzachar@gmail.com wrote:

> From: Nir Tzachar <nir.tzachar@gmail.com>
> 
> Remove the old hotkeys feature, and replace by a regular string search.
> Behaviour of search is as advised by Sam.
> 
> From nconfig help:
> 
> Searching: pressing '/' triggers search mode. nconfig performs a
>            regular string compare, case insensitive, starting at

I would say: simple string compare
"regular" has no meaning (at least for me) there.

>            the beginning of each menu line.\n"
>            Pressing the up/down keys highlights the previous/next
>            matching item. Backspace removes one character from the
>            match string. Pressing either '/' again or ESC exits\
>            search mode. All other keys behave normally.
> 
> Miscellaneous other changes (including Rundy's Justin's input).

Yes, the bottom menu and the typos are fixed.  Thanks.

However, I'm not finding this terribly useful, mostly due to it starting
comparison at the beginning of each menu line.

E.g., I'd like to be able to find "emulations" in the top-level menu here:
	Executable file formats / Emulations  --->

or I'd like to be able to find "crc" menu items in any sub-menu.
Maybe I should just stick to config symbol searches.  I don't think it's all
that likely that people will know how each menu line text begins.


As for the search UI, I'd rather that it be presented like the symbol search,
in a box, instead of just a single line at the top of the screen.


> Signed-off-by: Nir Tzachar <nir.tzachar@gmail.com>
> ---
>  scripts/kconfig/nconf.c     |  350 +++++++++++++++++++++++++------------------
>  scripts/kconfig/nconf.gui.c |   20 ++--
>  scripts/kconfig/nconf.h     |    3 +-
>  3 files changed, 213 insertions(+), 160 deletions(-)


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
