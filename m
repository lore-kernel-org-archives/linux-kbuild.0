Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.177]:64075 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675AbZEWLWe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 23 May 2009 07:22:34 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: "make config" to another architecture doesn't relink include/asm
Date: Sat, 23 May 2009 13:22:15 +0200
References: <alpine.LFD.2.00.0905221219500.13933@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.0905221219500.13933@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Message-Id: <200905231322.16154.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, sam@ravnborg.org

On Friday 22 May 2009, Robert P. J. Day wrote:
>   shouldn't it be sufficient that, if i do another "make ??_defconfig"
> to another architecture, all traces of the previous configure are
> erased and include/asm should be relinked automatically?

In 2.6.30, the symlink is finally no longer needed, so maybe we
should simply drop it to solve this problem as well.

	Arnd <><
