Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:58216 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932937AbaLKBl3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Dec 2014 20:41:29 -0500
Date: Thu, 11 Dec 2014 10:41:19 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: fix scripts/headers.sh to see the correct Kbuild path
In-Reply-To: <1418075913.2058.71.camel@x220>
References: <1417589535-15867-1-git-send-email-yamada.m@jp.panasonic.com> <1418075913.2058.71.camel@x220>
Message-Id: <20141211104119.A482.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,


On Mon, 08 Dec 2014 22:58:33 +0100
Paul Bolle <pebolle@tiscali.nl> wrote:

> Masahiro,
> 
> On Wed, 2014-12-03 at 15:52 +0900, Masahiro Yamada wrote:
> > The exported headers were moved to "uapi" directories.
> > We should check the existence of arch/*/include/uapi/asm/Kbuild.
> > 
> > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> > ---
> 
> Does this patch fix any problems? If so, which?


I am fixing a wrong code.

Actually, the "um" architecture does not support headers install.

 arch/um/include/asm/Kbuild exists
 arch/um/include/uapi/asm/Kbuild does not exist

Checking arch/*/include/asm/Kbuild does not work.


Moreover, the top Makefile is checking  arch/*/include/uapi/asm/Kbuild


headers_install: __headers
        $(if $(wildcard $(srctree)/arch/$(hdr-arch)/include/uapi/asm/Kbuild),, \
          $(error Headers not exportable for the $(SRCARCH) architecture))





> And why did no one
> notice these problems before? Perhaps the commit explanation could
> mention that.


You will notice the code below:

for arch in ${archs}; do
        case ${arch} in
        um)        # no userspace export
                ;;


"um" has already been omitted and it never reaches do_command().
That is why nobody has noticed this issue.

Uh, OK, we do not need double-checking.




Best Regards
Masahiro Yamada

