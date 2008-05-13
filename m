Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.234]:25204 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755342AbYEMXU1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 May 2008 19:20:27 -0400
Received: by rv-out-0506.google.com with SMTP id l9so3504466rvb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2008 16:20:25 -0700 (PDT)
Message-ID: <a27c0c970805131620o42d9ff0cm14aaaf2b99582bab@mail.gmail.com>
Date: Tue, 13 May 2008 16:20:25 -0700
From: "Greg Steuck" <greg@nest.cx>
Subject: Switched from hardcoded ".config" to conf_get_configname()
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org
Cc: linux-kbuild@vger.kernel.org

Hey Roman,

I needed the following one line patch to make KCONFIG_CONFIG usable
with conf -s:

--- scripts/kconfig/conf.c#1    2008-05-13 14:43:41.000000000 -0700
+++ scripts/kconfig/conf.c#2    2008-05-13 16:16:40.000000000 -0700
@@ -561,7 +561,7 @@
                }
                break;
        case ask_silent:
-               if (stat(".config", &tmpstat)) {
+               if (stat(conf_get_configname(), &tmpstat)) {
                        printf(_("***\n"
                                "*** You have not yet configured your kernel!\n"
                                "*** (missing kernel .config file)\n"


Thanks
Greg
-- 
nest.cx is Gmail hosted, use PGP for anything private. Key:
http://tinyurl.com/ho8qg
Fingerprint: 5E2B 2D0E 1E03 2046 BEC3 4D50 0B15 42BD 8DF5 A1B0
