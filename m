Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:54246 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933146AbaFKQUV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jun 2014 12:20:21 -0400
Received: by mail-pa0-f44.google.com with SMTP id bj1so2071156pad.31
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jun 2014 09:20:20 -0700 (PDT)
From: Andy Lutomirski <luto@amacapital.net>
Subject: [PATCH 1/2] kbuild: Add recipe-cmd, an @-less cmd variant
Date: Wed, 11 Jun 2014 09:20:06 -0700
Message-Id: <b3ea9607ad67524018c336e1dd54f5d729d60324.1402503408.git.luto@amacapital.net>
In-Reply-To: <cover.1402503408.git.luto@amacapital.net>
References: <5398749B.4090209@zytor.com>
 <cover.1402503408.git.luto@amacapital.net>
In-Reply-To: <cover.1402503408.git.luto@amacapital.net>
References: <cover.1402503408.git.luto@amacapital.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, Josh Boyer <jwboyer@fedoraproject.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>

It's awkward to put $(call cmd,xyz) in a loop in a recipe because
the pesky at sign gets in the way.

Signed-off-by: Andy Lutomirski <luto@amacapital.net>
---
 scripts/Kbuild.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 122f95c..3e60923 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -194,6 +194,7 @@ echo-cmd = $(if $($(quiet)cmd_$(1)),\
 
 # printing commands
 cmd = @$(echo-cmd) $(cmd_$(1))
+recipe-cmd = $(echo-cmd) $(cmd_$(1))
 
 # Add $(obj)/ for paths that are not absolute
 objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
-- 
1.9.3

