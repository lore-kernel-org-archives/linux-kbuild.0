Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:54858 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752289Ab0ARM5m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jan 2010 07:57:42 -0500
Message-ID: <4B545AC5.5080306@suse.cz>
Date: Mon, 18 Jan 2010 13:57:41 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Kconfig with multiple sources  of integer value
References: <20100111083002.GA24987@trinity.fluff.org>
In-Reply-To: <20100111083002.GA24987@trinity.fluff.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 11.1.2010 09:30, Ben Dooks wrote:
> It would be nice if I could say
> 
> config S3C24XX_GPIO_EXTRA
> 
> and then
> 
> config MACH_OSIRIS
>        ...
>        set_min S3C24XX_GPIO_EXTRA 128
> 
> or something similar.

Or maybe extend 'select' to accept
select FOO=<value>
and allow select for integer options too (in which case, the =<value>
would be mandatory). Then it would look like

config MACH_OSIRIS
       ...
       select S3C24XX_GPIO_EXTRA=128

What do you think?

Michal
