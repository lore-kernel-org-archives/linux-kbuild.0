Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:57824 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751640Ab2JDUca (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Oct 2012 16:32:30 -0400
Received: by mail-ie0-f174.google.com with SMTP id k13so1965797iea.19
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Oct 2012 13:32:30 -0700 (PDT)
From: Jonathan Kliegman <kliegs@chromium.org>
Subject: [PATCH] modpost: Permit .GCC.command.line sections
Date: Thu,  4 Oct 2012 16:32:19 -0400
Message-Id: <1349382739-24838-1-git-send-email-kliegs@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jonathan Kliegman <kliegs@chromium.org>

Allow .GCC.command.line sections in modules to prevent modpost warnings:
WARNING: sound/usb/snd-usbmidi-lib.o (.GCC.command.line): unexpected non-allocatable section.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
---
 scripts/mod/modpost.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a509ff8..9f579d5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -815,6 +815,7 @@ static const char *section_white_list[] =
 	".debug*",
 	".zdebug*",		/* Compressed debug sections. */
 	".GCC-command-line",	/* mn10300 */
+	".GCC.command.line",	/* record-gcc-switches, non mn10300 */
 	".mdebug*",        /* alpha, score, mips etc. */
 	".pdr",            /* alpha, score, mips etc. */
 	".stab*",
-- 
1.7.7.3

