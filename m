Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:40016 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754459Ab1FHPip (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jun 2011 11:38:45 -0400
Date: Wed, 8 Jun 2011 17:38:43 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [RFCv5] Kbuild: factor parser rules
Message-ID: <20110608153843.GB4612@sepie.suse.cz>
References: <1307479931-10424-1-git-send-email-lacombar@gmail.com>
 <1307509408-2497-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307509408-2497-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, Jun 08, 2011 at 01:03:28AM -0400, Arnaud Lacombe wrote:
> Hi Michal,
> 
> Here is some update concerning the parser generation merge. I do not repost the
> whole serie as it may be overkill. You can find the latest branch at:
> 
> git://github.com/lacombar/linux-2.6.git kbuild-implicit-parser-rule
> 
> So let't get it done the safe way...
> 
> Changes since v4:
> [...]


Hi, I found now what my problem with genksyms was. I use O= and you
removed the -I$(src) for the lexer (which is a generated file, but needs
genksyms.h from the source directory). With the following patch,
everything should work again (test builds still running, but they built
genksyms already):

diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 0b883e3..ee1071f 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -6,6 +6,7 @@ genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 
 # -I needed for generated C source (shipped source)
 HOSTCFLAGS_parse.tab.o := -Wno-uninitialized -I$(src)
+HOSTCFLAGS_lex.lex.o := -I$(src)
 
 $(obj)/parse.tab.o: $(obj)/parse.tab.c $(obj)/parse.tab.h
 
Michal
