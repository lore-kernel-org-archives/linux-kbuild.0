Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-vbr3.xs4all.nl ([194.109.24.23]:3446 "EHLO
	smtp-vbr3.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753558AbYF3NZ4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jun 2008 09:25:56 -0400
Date: Mon, 30 Jun 2008 15:19:09 +0200 (CEST)
From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: kconfig - hex are considered decimal
In-Reply-To: <20080629115120.GA4654@uranus.ravnborg.org>
Message-ID: <Pine.LNX.4.64.0806301404270.6791@localhost.localdomain>
References: <20080629115120.GA4654@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On Sun, 29 Jun 2008, Sam Ravnborg wrote:

> Sample (first line is with unmodifed kconfig):
> 
> -CONFIG_RADIO_ZOLTRIX_PORT=0x20c
> +CONFIG_RADIO_ZOLTRIX_PORT=20c
> 
> I guess this has something to do with the way we
> represent a hex value internally. But I have not yet
> dived into it.
> 
> Can you see where it goes wrong?

It's not really wrong, it's a valid value there. Only if it's saved like 
this in the header file, it would be wrong.
I noticed that during testing too, that value is coming liking that 
directly from the Kconfig file. The real fix would be to deprecate hex 
values without prefix and automatically adding the prefix where needed 
(currently loading of Kconfig/.config).
I though about making it more consistent, but it's not really a pressing 
issue, so I left it as is for now.

bye, Roman
