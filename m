Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47919 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753623Ab3HPN22 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Aug 2013 09:28:28 -0400
Message-ID: <520E28F0.4080502@suse.cz>
Date: Fri, 16 Aug 2013 15:28:16 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] Gtk/Qt interface flavours ported to newest toolkit
 versions
References: <kconfig-port-gtk-qt> <1375612711-17140-1-git-send-email-david.graeff@web.de>
In-Reply-To: <1375612711-17140-1-git-send-email-david.graeff@web.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Graeff <david.graeff@web.de>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, sam@ravnborg.org

On 4.8.2013 12:38, David Graeff wrote:
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

I only received 1/4 and 4/4 through the mailing list. Perhaps vger
rejected the other two patches for size reasons? I know that Yann told
to to send full copies of patches instead of pull request, but could you
please create a repository on some git hosting site and publish the
patches there _in addition to_ sending them by mail?

Thanks,
Michal
