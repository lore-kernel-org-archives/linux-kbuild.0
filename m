Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:61887 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755864Ab3GKVGB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jul 2013 17:06:01 -0400
Date: Thu, 11 Jul 2013 23:06:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Kconfig Gtk/Qt interface flavours ported to newest toolkit
	versions
Message-ID: <20130711210600.GD29911@merkur.ravnborg.org>
References: <1372778550-22110-1-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1372778550-22110-1-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: davidgraeff <david.graeff@web.de>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Tue, Jul 02, 2013 at 05:22:21PM +0200, davidgraeff wrote:
> Hello all,
> 
> I've no idea if this is the right way to send patches. I'm kind of new to this.
> Attached is a patchset basically for porting the graphical Gtk and Qt flavours
> to their latest toolkit versions (Gtk3 and Qt4 with compatibility to Qt5 respectively).
> It took a day or so to get into the code -> Newly inserted and changed source code
> is commented in many/some places now.
> 
> I do not know if it was on purpose to keep all flavours except lxdialog in one single directory,
> but for presumably easier maintenance the first patch split of each flavours into its
> own subdirectory. Additionally I ripped out flavour specific makefile targets. Each subdirectory
> contains a separate makefile now.
> An advantage is a more simple makefile for e.g. all the C++/Qt stuff, where Qt specific moc and uic
> tools are necessary.
> 
> The 2nd to 6th patch port the Gtk2 ui to the modern Gtk3 toolkit including the conversion
> from a libglade (deprecated) interface to a gtkbuilder interface.
> 
> The 7th to 9th patch port the Qt3/Qt4+Qt3support ui to the current version 4 of the Qt toolkit.
> The gui is no longer realised by handwritten c++ code but by the Qt Designer for a much easier
> user interface design and less code.
> The Model/View concept of Qt is heavily used and no Qt3 support classes are used anymore,
> as a result the code should work with the newest Qt5, too.
> 
> Those newer graphical kconfig flavours will be used by a project I'm involved in so
> I will maintain it for the next couple of months.
> 
> If I did anything wrong, please instruct me or provide me a link please.

It seems patch [1/9] is missing. Maybe the size as too big.
Did you specify "-D -M" when you ran "git format-patch"?
This will show file relocatiosn in a very efficent and reviewable way.

	Sam
