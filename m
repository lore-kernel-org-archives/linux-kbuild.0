Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:52413 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751087Ab1BZXxX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Feb 2011 18:53:23 -0500
MIME-Version: 1.0
In-Reply-To: <4D698DF1.7060303@suse.com>
References: <4D671556.80607@suse.com>
	<20110225060706.GA12723@merkur.ravnborg.org>
	<AANLkTimFd+KFKgiOF8iVoM8Pk77Zy+5CsFs5BCYqCw=L@mail.gmail.com>
	<AANLkTimTm40Sp5-kMaL4d1oXf3CzytZsBCus3DN0jwD-@mail.gmail.com>
	<AANLkTi=bJRh=0N6wP3LJWTQHSXsX4xdE7oOzK0CFcTfc@mail.gmail.com>
	<4D698DF1.7060303@suse.com>
Date: Sat, 26 Feb 2011 18:53:22 -0500
Message-ID: <AANLkTikaOA48YPrmukHsVg_njzWsLFEHK54fe0Mn6yUd@mail.gmail.com>
Subject: Re: [PATCH] Add ``cloneconfig'' target
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

Hi,

On Sat, Feb 26, 2011 at 6:34 PM, Jeff Mahoney <jeffm@suse.com> wrote:
> But this argument isn't really relevant. As with all of the other files
> listed in the defconfig_list, if it's missing (or can't be read), it
> will move on to the next one. Decompressing it first just makes things
> /more/ confusing since the initial message of 'defaults read from...'
> will read the name of the decompressed temporary file, not the source.
> It makes more sense to see it as "reading defaults from /proc/config.gz
> since that's obvious to anyone with kernel experience.
>
no, this would only be the behavior of the way you did it.

 - Arnaud
