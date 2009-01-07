Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:55647 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754861AbZAGVTL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Jan 2009 16:19:11 -0500
Date: Wed, 7 Jan 2009 22:33:15 +0100
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] [1/3] KBUILD: Add script to manipulate .config files on the command line
Message-ID: <20090107213315.GN496@one.firstfloor.org>
References: <20090103321.351399938@firstfloor.org> <20090107201849.GH4647@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090107201849.GH4647@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

> When I try to run the script with no arguments nothing happens!?!
> 
> I will merge as is but please followup with a patch so it prints out usage
> in this situation.

Here's a patch 

-Andi

---

Kbuild: print usage with no arguments in scripts/config

Requested by Sam.

Signed-off-by: Andi Kleen <ak@linux.intel.com>

---
 scripts/config |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-2.6.28-kbuild/scripts/config
===================================================================
--- linux-2.6.28-kbuild.orig/scripts/config	2009-01-02 02:56:55.000000000 +0100
+++ linux-2.6.28-kbuild/scripts/config	2009-01-07 22:17:40.000000000 +0100
@@ -60,6 +60,10 @@
 	FN=.config
 fi
 
+if [ "$1" = "" ] ; then
+	usage
+fi
+
 while [ "$1" != "" ] ; do
 	CMD="$1"
 	shift

-- 
ak@linux.intel.com
