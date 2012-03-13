Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:51849 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756046Ab2CMWAv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Mar 2012 18:00:51 -0400
MIME-Version: 1.0
Date: Tue, 13 Mar 2012 18:00:49 -0400
Message-ID: <CAP=VYLoStscdVJretZ-Rkbp7V3Vsm8N0oWcjih7ruHFiDN7CiA@mail.gmail.com>
Subject: Inconsistent kallsyms data on ARM.
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>

This bug(?)  has been seen to float from one ARM build to another since
I started tracking the day-to-day changes in Stephen's linux-next builds.

I see it was discussed earlier:

   https://lkml.org/lkml/2011/8/2/233
   https://lkml.org/lkml/2011/10/8/70

but no concrete cause was nailed down.  Can the linux-next build results
help shed some light on this in any way?  Since it seems sporadic, is
there value in embedding a diagnostic of some sort in the infrastructure
so that when the error is detected, that it prints out more detailed info?

I can provide links to failed linux-next builds, but at the moment, all they
really seem to have is the same repeated error message, like this one:

   http://kisskb.ellerman.id.au/kisskb/buildresult/5869367/

and I don't see that helping folks all that much....

Paul.
