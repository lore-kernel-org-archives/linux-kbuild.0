Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:13643 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968472Ab3HJJB3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 10 Aug 2013 05:01:29 -0400
Date: Sat, 10 Aug 2013 11:01:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/4] Gtk/Qt interface flavours ported to newest
	toolkit versions
Message-ID: <20130810090127.GA8521@merkur.ravnborg.org>
References: <1375612711-17140-1-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375612711-17140-1-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Graeff <david.graeff@web.de>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On Sun, Aug 04, 2013 at 12:38:27PM +0200, David Graeff wrote:
> Hi Sam, Yann, all,
> 
> I prepared a rebased V2 of the patchset. As far as I get the consensus is to replace the existing
> Qtk and Qt flavours because there exist a fallback (n/mconf) for users that do not have the never libs available.
> 
> I reorganized the commits and used "-D -M" flags this time for a better review. 
> There are some tool generated files like gconfig/gconf.ui and qconfig/mainwindow.ui which surely
> break the 80-column readability rule but are best viewed in their respective editor (gtk: glade,
> qt: designer) anyway.
> 
> The Qt flavour is Qt5 compatible but I did not changed the build system to actually use Qt5.
> I've tested the Qt flavour with Qt 4.8.4, the Gtk flavour with Gtk 3.6.4.
> 
> I have another question regarding the patch procedure: I've seen some mails here only requesting for
> pull requests. Is it common to send pull requests instead of a set of patches?
> 
> Regards,
> David
> 
> David Graeff (4):
>   KConf: Move flavours into their own subdirectories.
>   KConf: Update/Port Gtk flavour to use Gtk3
>   KConf: Qt interface port to Qt4/Qt5, removed Qt3 Support
>   KConf: images.c for gtk/qt gui flavour reoganized

General comment.
The prefix should be "kconfig: bla bla"

	Sam

