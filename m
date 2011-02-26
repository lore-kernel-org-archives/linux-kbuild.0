Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:47447 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263Ab1BZXuU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Feb 2011 18:50:20 -0500
MIME-Version: 1.0
In-Reply-To: <4D698F12.6030205@suse.com>
References: <4D671556.80607@suse.com>
	<20110225060706.GA12723@merkur.ravnborg.org>
	<AANLkTimFd+KFKgiOF8iVoM8Pk77Zy+5CsFs5BCYqCw=L@mail.gmail.com>
	<AANLkTimTm40Sp5-kMaL4d1oXf3CzytZsBCus3DN0jwD-@mail.gmail.com>
	<AANLkTi=bJRh=0N6wP3LJWTQHSXsX4xdE7oOzK0CFcTfc@mail.gmail.com>
	<AANLkTik0VoCSHbpZ=CqG8ZoBNKVQuOEKf3bf19uz-tjj@mail.gmail.com>
	<AANLkTi=+PD9jTMJ+MsB0S+ESmN97O69HosbuVB7fgaQN@mail.gmail.com>
	<4D698F12.6030205@suse.com>
Date: Sat, 26 Feb 2011 18:50:19 -0500
Message-ID: <AANLkTikQY03RXDE02-egVEVCwWkFNLe1ynm8LoMWKvPK@mail.gmail.com>
Subject: Re: [PATCH] Add ``cloneconfig'' target
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

Hi,

On Sat, Feb 26, 2011 at 6:38 PM, Jeff Mahoney <jeffm@suse.com> wrote:
> I added bzip2 as an exercise. But realistically, what would be wrong
> with distributors deciding to ship /boot/config-$UNAME_RELEASE.bz2 and
> saving a bit of valuable /boot disk space?
>
I don't really care, that's outside of kconfig prerogative.

> Even if people /do/ submit patches do do all of those formats, your
> argument is based on the premise that having that ability is necessarily
> bad. I don't think we need them, but I don't think it's a good argument
> against this patch either.
>
you welcome a lot of potential bloat and wheel re-invention. Both are bad.

 - Arnaud
