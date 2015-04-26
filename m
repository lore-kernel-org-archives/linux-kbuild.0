Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud2.xs4all.net ([194.109.24.21]:41635 "EHLO
	lb1-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750761AbbDZVTM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Apr 2015 17:19:12 -0400
Message-ID: <1430083148.2411.15.camel@x220>
Subject: Re: [PATCH] kconfig: add tinfo library if it exists to lxdialog
 linking flags
From: Paul Bolle <pebolle@tiscali.nl>
Date: Sun, 26 Apr 2015 23:19:08 +0200
In-Reply-To: <20150425160546.GA4002@freedom>
References: <20150425160546.GA4002@freedom>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sylvain.bertrand@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2015-04-25 at 16:05 +0000, sylvain.bertrand@gmail.com wrote:
> HOSTLD  scripts/kconfig/mconf
> /bin/ld: scripts/kconfig/lxdialog/checklist.o: undefined reference to symbol 'acs_map'
> 
> Add tinfo library to lxdiablog linking flags, if it exists.
> 
> Signed-off-by: Sylvain BERTRAND <sylvain.bertrand@gmail.com>
> ---
> --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> @@ -4,6 +4,9 @@
>  # What library to link
>  ldflags()
>  {
> +	# Some ncurses symbols are in tinfo library, if it exists
> +	pkg-config --libs tinfow 2>/dev/null
> +	pkg-config --libs tinfo 2>/dev/null
>  	pkg-config --libs ncursesw 2>/dev/null && exit
>  	pkg-config --libs ncurses 2>/dev/null && exit
>  	for ext in so a dll.a dylib ; do

It looks like commit fc9c6e000f62 ("menuconfig: optionally use
pkg-config to detect ncurses libs") claims to already fix this. And your
patch is obviously done on top of that commit.

So I did some further, well, research. That is: I skimmed man pkg-config
and stared a bit at the pkg-config related files shipped with
ncurses-devel (for Fedora 20). And to me it seems
	pkg-config --libs ncursesw

or
	pkg-config --libs ncurses

should already add -ltinfow or -ltinfo if those flags would be needed,
just like that commit implies.

Is that how pkg-config should work? If so, I wonder why it fails for
you.

Thanks,


Paul Bolle

