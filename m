Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from p-mail2.rd.orange.com ([195.101.245.16]:53406 "EHLO
	p-mail2.rd.orange.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753722Ab3HPNge (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Aug 2013 09:36:34 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v2 0/4] Gtk/Qt interface flavours ported to newest toolkit versions
Date: Fri, 16 Aug 2013 15:36:29 +0200
References: <kconfig-port-gtk-qt> <1375612711-17140-1-git-send-email-david.graeff@web.de> <520E28F0.4080502@suse.cz>
In-Reply-To: <520E28F0.4080502@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <201308161536.29721.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: David Graeff <david.graeff@web.de>, linux-kbuild@vger.kernel.org, sam@ravnborg.org

Michal, David, All,

On Friday 16 August 2013 15:28:16 Michal Marek wrote:
> On 4.8.2013 12:38, David Graeff wrote:
> > Hi Sam, Yann, all,
> > 
> > I prepared a rebased V2 of the patchset. As far as I get the consensus is to replace the existing
> > Qtk and Qt flavours because there exist a fallback (n/mconf) for users that do not have the never libs available.
> > 
> > I reorganized the commits and used "-D -M" flags this time for a better review. 
> > There are some tool generated files like gconfig/gconf.ui and qconfig/mainwindow.ui which surely
> > break the 80-column readability rule but are best viewed in their respective editor (gtk: glade,
> > qt: designer) anyway.
> > 
> > The Qt flavour is Qt5 compatible but I did not changed the build system to actually use Qt5.
> > I've tested the Qt flavour with Qt 4.8.4, the Gtk flavour with Gtk 3.6.4.
> > 
> > I have another question regarding the patch procedure: I've seen some mails here only requesting for
> > pull requests. Is it common to send pull requests instead of a set of patches?
> > 
> > Regards,
> > David
> > 
> > David Graeff (4):
> >   KConf: Move flavours into their own subdirectories.
> >   KConf: Update/Port Gtk flavour to use Gtk3
> >   KConf: Qt interface port to Qt4/Qt5, removed Qt3 Support
> >   KConf: images.c for gtk/qt gui flavour reoganized
> 
> I only received 1/4 and 4/4 through the mailing list. Perhaps vger
> rejected the other two patches for size reasons? I know that Yann told
> to to send full copies of patches instead of pull request, but could you
> please create a repository on some git hosting site and publish the
> patches there _in addition to_ sending them by mail?

Indeed, they are big patches.

I postponed getting them in my branch in waiting to get more reviews on
these, since I'm not really comfortable with Qt/GTK.

I'll eventually get them, and if there are enough good reviews coming in
before 3.12, I'll queue them for 3.12; otherwise, I was aiming for 3.13.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
