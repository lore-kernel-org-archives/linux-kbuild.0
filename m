Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:45376 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035Ab0HQUoC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 16:44:02 -0400
Received: by wyb32 with SMTP id 32so7461814wyb.19
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2010 13:44:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100817203446.GC11592@merkur.ravnborg.org>
References: <AANLkTinuJJXAB6b0ap6yn0X9nM7grQmYxoJSdyOPVmVj@mail.gmail.com>
	<1282023725-20428-1-git-send-email-lacombar@gmail.com>
	<20100817203446.GC11592@merkur.ravnborg.org>
Date: Tue, 17 Aug 2010 16:44:00 -0400
Message-ID: <AANLkTi=Gd9=9dDsD9Q90OfiWpfeMx5Yn+2RjQ24_9eaB@mail.gmail.com>
Subject: Re: [PATCH] kbuild: implement the `mainmenu' directive
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On Tue, Aug 17, 2010 at 4:34 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> Any particular reason not to use menu_warn() ?
>
I would need a valid `struct menu *' ? same argument for prop_warn() :)

> When you submit the final patch then please divide it in two.
> One patch that contains the zconf.y changes (like you do here),
> and then a subsequent patch that updates the relevant _shipped files.
> This makes review so much easier.
>
It seemed you were saying you had a patch, quoting what you said in
the beginning:

> I actually attempted to go the "struct property" way.
> This looks much simpler and I like how straight forward it is.
>

or did I wrongly understood ?

 - Arnaud
