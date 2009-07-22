Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:25119 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752458AbZGVUpv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Jul 2009 16:45:51 -0400
Date: Wed, 22 Jul 2009 13:43:21 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 0/6] kbuild configuration system improvements
Message-Id: <20090722134321.34f1ebf7.randy.dunlap@oracle.com>
In-Reply-To: <20090718072138.GA7711@merkur.ravnborg.org>
References: <1247386308-19628-1-git-send-email-crq@kernel.org>
	<20090718072138.GA7711@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Cheng Renquan <crq@kernel.org>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, crquan@gmail.com, Roman Zippel <zippel@linux-m68k.org>

On Sat, 18 Jul 2009 09:21:38 +0200 Sam Ravnborg wrote:

> On Sun, Jul 12, 2009 at 04:11:42PM +0800, Cheng Renquan wrote:
> > From: Cheng Renquan <crquan@gmail.com>
> > 
> > These patches improve usability of kernel configuration system,
> > 
> > 1. add symbol's value shown accompanied in config item's help message;
> > 2. move the real plumbing functions code from mconf.c to menu.c, make them
> >    be able to be shared with other configuration methods;
> > 3. add "symbol's value shown" support for gconfig/xconfig/config;
> > 
> >     0001-add-symbol-value-to-help-find-the-real-depend.patch
> >     0002-add-menu_get_ext_help-function-to-display-more-infor.patch
> >     0003-menuconfig-improvements.patch
> >     0004-make-use-of-menu_get_ext_help-in-gconfig.patch
> >     0005-make-use-of-menu_get_ext_help-in-qconfig.patch
> >     0006-make-use-of-menu_get_ext_help-in-make-config.patch
> 
> I fixed them all up to:
> 1) include "kconfig:" prefix in subject
> 2) cc: of Roman Zippel which is kconfig maintainer
> 
> There were a few checkpatch issues that I decided to ignore for now.
> 
> Please always cc: Roman on kconfig patches as he is the mintainer.
> 
> Applied to kbuild-next.git.


FWIW, I still get a segfault in gconfig (as I reported several months ago).
I suppose that if it's a real issue, someone else will also see this.

---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
