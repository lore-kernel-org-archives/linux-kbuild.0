Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fallback-out2.mxes.net ([216.86.168.191]:28092 "EHLO
	fallback-in2.mxes.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756107AbZIVNjK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2009 09:39:10 -0400
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Subject: module: Speed up symbol resolution during module loading
Date: Tue, 22 Sep 2009 14:28:28 +0100
Message-Id: <1253626112-18429-1-git-send-email-alan-jenkins@tuffmail.co.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rusty@rustcorp.com.au
Cc: lkml@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-modules@vger.org

The following series applies against v2.6.31. It sorts the tables of builtin
symbols, so the module loader can resolve them using a binary search.

The kbuild changes to achieve this are less scary than I expected.  I'm
optimistic that they can be accepted without radical alteration :-).

Quoting from the last patch in this series:

"On my EeePC 701, coldplug is mainly cpu bound and takes 1.5 seconds
during boot. perf showed this change eliminated 20% of cpu cycles during
coldplug, saving 0.3 seconds of real time.

These savings may not be representative since my config is not very well
tuned.  The numbers above represent the loading of 35 modules,
referencing a total of 441 symbols.  Nevertheless, it shows why I think
this is worth doing."

Alan
