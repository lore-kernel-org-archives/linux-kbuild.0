Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ppsw-6.csi.cam.ac.uk ([131.111.8.136]:60158 "EHLO
	ppsw-6.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751907AbZK0TO7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Nov 2009 14:14:59 -0500
Date: Fri, 27 Nov 2009 19:15:01 +0000
From: Tony Finch <dot@dotat.at>
Subject: Re: [PATCH] unifdef: update to upstream revision 1.189
In-Reply-To: <20091127181749.GA16177@merkur.ravnborg.org>
Message-ID: <alpine.LSU.2.00.0911271901430.6581@hermes-1.csi.cam.ac.uk>
References: <E1NE3M6-0003Za-OJ@hermes-1.csi.cam.ac.uk> <20091127181749.GA16177@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "Justin P. Mattock" <justinmattock@gmail.com>

On Fri, 27 Nov 2009, Sam Ravnborg wrote:
>
> Can you confirm that this does not regress with respect to the changes
> that Russell King implemented in the commit:
> eedc9d83eaab2d35fb9dd1ec25b765dec964e26c
> ("kbuild: fix headers_exports with boolean expression")

Yes. I ran the following commands:

  git checkout master
  gmake distclean
  gmake headers_install ARCH=i386 INSTALL_HDR_PATH=../include-master
  git checkout fanf-unifdef
  gmake distclean
  gmake headers_install ARCH=i386 INSTALL_HDR_PATH=../include-fanf
  diff -Nru -x ..install.cmd ../include-master ../include-fanf

and diff produced no output.

I didn't mention Russell's change in the commit message since its
functionality isn't affected, although the code is different - Ben
Hutchings contributed it to me in February/March 2008.

Tony.
-- 
f.anthony.n.finch  <dot@dotat.at>  http://dotat.at/
GERMAN BIGHT HUMBER: SOUTHWEST 5 TO 7. MODERATE OR ROUGH. SQUALLY SHOWERS.
MODERATE OR GOOD.
