Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:11407 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756624Ab3GKU4u (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jul 2013 16:56:50 -0400
Date: Thu, 11 Jul 2013 22:56:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Kconfig Gtk/Qt interface flavours ported to newest toolkit
	versions
Message-ID: <20130711205647.GA29911@merkur.ravnborg.org>
References: <1372778550-22110-1-git-send-email-david.graeff@web.de> <20130703163038.GA3268@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130703163038.GA3268@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: davidgraeff <david.graeff@web.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

> 
> I did not do any review of the patches, since I have a concern about the
> series. It happens very often that, in enterprise ecosystems, the host
> build machines are running rather aging distro, such as RHEL 5 (or even
> RHEL 4 in some cases), so I think we still want the new kernels to be
> buildable (and thus configurable) on such machines (eg. for
> cross-compilation).
> 
> I have no idea when such enterprise distros have started bundling GTK3
> or Qt4/5, but given RHEL-4 (which is still use in some places) is 8
> years old, I doubt the new frontends would build on those distros.

IMO users restricted to these systems - if required to look at / modify the kernel
configuration can use one of the other frontends.
In other words - I do not think we shall stick to the old gtk / qt versions due to this.

> > I do not know if it was on purpose to keep all flavours except lxdialog in one single directory,
> 
> Historical artifact, I think... :-(
lxdialog was one a separate binary - later we did a very rough conversion
so it is now a single binary. But there are many left-overs from when it was
separated.

	Sam
