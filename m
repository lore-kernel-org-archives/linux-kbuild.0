Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f207.google.com ([209.85.219.207]:57322 "EHLO
	mail-ew0-f207.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750996AbZKGU7J (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 7 Nov 2009 15:59:09 -0500
Message-ID: <4AF5DF9F.5020208@tuffmail.co.uk>
Date: Sat, 07 Nov 2009 20:59:11 +0000
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: [PATCH 0/10] module: Speed up symbol resolution during module loading
 (using binary search)
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, carmelo73@gmail.com, linux-kbuild@vger.kernel.org

As requested by Mike Frysinger, this version of the series

1) generalizes the use of CONFIG_SYMBOL_PREFIX so that arbitrary symbol 
prefixes remain possible
2) uses CONFIG_SYMBOL_PREFIX to implement VMLINUX_SYMBOL() in the 
generic linker script, instead of relying on arch linker scripts to 
define it if needed.


I also changed the position of the patch which implements the above 
changes.  So it is possible to revert or drop the actual optimizations, 
without removing the cleanups and annoying Mike (or Rusty, or Tejun Heo, 
or miscellaneous fans of lib/bsearch.c :).

A clean revert may be useful if hash tables are added in future, to 
avoid the complexity of keeping hash tables + sorted tables + unsorted 
tables.  (This current series leaves module symbol tables unsorted).
