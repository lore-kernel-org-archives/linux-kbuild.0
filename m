Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:43985 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420Ab3KRSSM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Nov 2013 13:18:12 -0500
Received: by mail-wg0-f51.google.com with SMTP id m15so6475308wgh.6
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2013 10:18:11 -0800 (PST)
Date: Mon, 18 Nov 2013 19:18:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v3 0/5] Kconfig Gtk/Qt interface flavours ported to
 newest toolkit versions
Message-ID: <20131118181806.GD3458@free.fr>
References: <kconfig-port-gtk-qt>
 <1376922591-37504-1-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1376922591-37504-1-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Graeff <david.graeff@web.de>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org, mmarek@suse.cz

David, All,

On 2013-08-19 16:29 +0200, David Graeff spake thusly:
> David Graeff (5):
>   kconfig: Move flavours into their own subdirectories.
>   kconfig: Add qconfig makefile target additionally to the xconfig
>     target
>   kconfig: Update/Port Gtk flavour to use Gtk3
>   kconfig: Qt interface port to Qt4/Qt5, removed Qt3 Support
>   kconfig: images.c for gtk/qt gui flavour reoganized

Are you still interested in this series? If so, could you please rebase
it on top of the current tree, so it is easier to apply?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
