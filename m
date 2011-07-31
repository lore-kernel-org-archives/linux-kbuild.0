Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:42886 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752228Ab1GaRlE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 31 Jul 2011 13:41:04 -0400
Subject: Re: [PATCH 2/2] Enable 'make CONFIG_FOO=y oldconfig'
From: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 31 Jul 2011 18:40:58 +0100
In-Reply-To: <20110731100856.780d71de.rdunlap@xenotime.net>
References: <1312067499.22074.59.camel@i7.infradead.org>
	 <1312067670.22074.61.camel@i7.infradead.org>
	 <CACqU3MV460WGjmQdOOmhk3ZJT1FNjEjfuHqx8mYcgun9+7SfjA@mail.gmail.com>
	 <4E34998D.8060806@zytor.com>
	 <CACqU3MWn-OQVfLH96E+AeTCEjUw5+girXbuNgmUvXrEQuBe4vg@mail.gmail.com>
	 <4E34A1E4.8040103@zytor.com>
	 <CACqU3MVkLXoBq7KP2Jff=p7EiKR7DkPa4z7y0Rdah-dGzRvj4g@mail.gmail.com>
	 <1312097621.22074.71.camel@i7.infradead.org>
	 <20110731093740.39f7fbc3.rdunlap@xenotime.net>
	 <1312131467.22074.95.camel@i7.infradead.org>
	 <20110731100856.780d71de.rdunlap@xenotime.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1312134060.22074.99.camel@i7.infradead.org>
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Arnaud Lacombe <lacombar@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Sun, 2011-07-31 at 10:08 -0700, Randy Dunlap wrote:
> 
> OK, it seems that we agree that ARCH=x86 is an incomplete
> specification.
> Thanks. 

Of course it's incomplete, just as the legacy ARCH=i386 was incomplete.
Even an allnoconfig still had over a hundred lines more configuration
before it was a complete description of what gets built.

-- 
dwmw2

