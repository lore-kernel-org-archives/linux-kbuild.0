Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:37237 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753528Ab0HQC4X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 22:56:23 -0400
Received: by wwi17 with SMTP id 17so419848wwi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2010 19:56:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100817021937.GA9849@merkur.ravnborg.org>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
	<20100816123642.GA7233@merkur.ravnborg.org>
	<AANLkTimkEBaLs9Mx8V3_PLdj_-ioaRRo3JAjLH4MJBRd@mail.gmail.com>
	<20100817021937.GA9849@merkur.ravnborg.org>
Date: Mon, 16 Aug 2010 22:56:22 -0400
Message-ID: <AANLkTinuJJXAB6b0ap6yn0X9nM7grQmYxoJSdyOPVmVj@mail.gmail.com>
Subject: Re: [RFC 0/2] Factor Kconfig's prefix and package name
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

Hi,

On Mon, Aug 16, 2010 at 10:19 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> If you look closer you will see that the prompt in zconf.y is not used
> at all.
>
yep, that part is done, now lets have a look to the symbol replacement stuff...

 - Arnaud
