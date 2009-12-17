Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:43649 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787AbZLQF3F (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 00:29:05 -0500
Message-ID: <4B29BFE8.1000502@zytor.com>
Date: Wed, 16 Dec 2009 21:21:44 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: CONFIG_KPROBES=y build requires gawk
References: <20091216235617.GA12267@hexapodia.org>	<adabphy750b.fsf@roland-alpha.cisco.com> <4B29A686.9070603@redhat.com>	<ada3a3a6xs6.fsf@roland-alpha.cisco.com> <4B29BA13.7020502@redhat.com> <aday6l25gnm.fsf@roland-alpha.cisco.com>
In-Reply-To: <aday6l25gnm.fsf@roland-alpha.cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>, Michal Marek <mmarek@suse.cz>
Cc: Masami Hiramatsu <mhiramat@redhat.com>, Andrew Isaacson <adi@vmware.com>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>

On 12/16/2009 09:11 PM, Roland Dreier wrote:
> 
>  > As Al Viro said, if we run awk with LC_ALL=C, then the characters will be
>  > sorted as ASCII. So, your patch is OK if you can add LC_ALL=C just before
>  > $(AWK). (I'm not so sure whether Makefile can accept it...)
> 

I would strongly prefer the following solution as it solves this entire
class of problems globally, although I'd really want Michal's ACK for it:

diff --git a/Makefile b/Makefile
index 33d4732..7fefc13 100644
--- a/Makefile
+++ b/Makefile
@@ -302,6 +302,10 @@ MAKEFLAGS += --include-dir=$(srctree)
 $(srctree)/scripts/Kbuild.include: ;
 include $(srctree)/scripts/Kbuild.include

+# Avoid funny character set dependencies
+LC_ALL=C
+export LC_ALL
+
 # Make variables (CC, etc...)

 AS		= $(CROSS_COMPILE)as


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

