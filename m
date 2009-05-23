Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:58031 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751908AbZEWOMo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 23 May 2009 10:12:44 -0400
Date: Sat, 23 May 2009 10:11:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: "make config" to another architecture doesn't relink
 include/asm
In-Reply-To: <200905231322.16154.arnd@arndb.de>
Message-ID: <alpine.LFD.2.00.0905231010570.7113@localhost.localdomain>
References: <alpine.LFD.2.00.0905221219500.13933@localhost.localdomain> <200905231322.16154.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-478106526-1243087881=:7113"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, sam@ravnborg.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-478106526-1243087881=:7113
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 23 May 2009, Arnd Bergmann wrote:

> On Friday 22 May 2009, Robert P. J. Day wrote:
> > =A0 shouldn't it be sufficient that, if i do another "make
> > ??_defconfig" to another architecture, all traces of the previous
> > configure are erased and include/asm should be relinked
> > automatically?

> In 2.6.30, the symlink is finally no longer needed, so maybe we
> should simply drop it to solve this problem as well.

  or that could work, too.  :-)

rday
--


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--8323328-478106526-1243087881=:7113--
