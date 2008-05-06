Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from linux-m68k.xs4all.nl ([82.95.193.92]:59432 "EHLO
	scrub.xs4all.nl" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758166AbYEFDIn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 May 2008 23:08:43 -0400
Date: Tue, 6 May 2008 05:08:40 +0200 (CEST)
From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: [PATCH 2/2] kconfig: make oldconfig less chatty and clean up
 conf.c
In-Reply-To: <20080504185950.GC23063@uranus.ravnborg.org>
Message-ID: <Pine.LNX.4.64.0805060455590.30555@scrub.home>
References: <20080502204729.GA6534@uranus.ravnborg.org>
 <20080504185737.GA23063@uranus.ravnborg.org> <20080504185950.GC23063@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi,

On Sun, 4 May 2008, Sam Ravnborg wrote:

> We now check for valid stadin in both cases and this
> may break a script here and there.

I strongly disagree with this, please preserve the old behaviour. It took 
a while to work out the current behaviour.
Only silentoldconfig checks for stdin because it's used as hook during 
kbuild to verify the config. For all other interactive targets the user 
has to know what he's doing, e.g. it's valid to do "yes '' | make 
oldconfig".

> -		switch (input_mode) {
> -		case set_no:	 name = "allno.config"; break;
> -		case set_mod:	 name = "allmod.config"; break;
> -		case set_yes:	 name = "allyes.config"; break;
> -		case set_random: name = "allrandom.config"; break;
> -		default: break;
> -		}
> -		if (!stat(name, &tmpstat))
> -			conf_read_simple(name, S_DEF_USER);
> -		else if (!stat("all.config", &tmpstat))
> -			conf_read_simple("all.config", S_DEF_USER);
> -		break;
> -	default:
> -		break;
>  	}

This isn't yet in aconf.c.

bye, Roman
