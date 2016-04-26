Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:34041 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752246AbcDZPVh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 11:21:37 -0400
Received: by mail-qg0-f53.google.com with SMTP id c6so7058827qga.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2016 08:21:37 -0700 (PDT)
Date: Tue, 26 Apr 2016 11:21:34 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH] kbuild: adjust ksym_dep_filter for some cmd_* renames
Message-ID: <alpine.LFD.2.20.1604261118060.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


The following renames occurred recently:

  cmd_cc_i_c --> cmd_cpp_i_c
  cmd_as_s_S --> cmd_cpp_s_S

The respective cc_*_c and as_*_S patterns no longer match the above
therefore additional patterns are needed.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index a09927e027..36e9475395 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -275,10 +275,12 @@ else
 flags_nodeps = $(filter-out -Wp$(comma)-M%, $($(1)))
 ksym_dep_filter =                                                            \
 	case "$(1)" in                                                       \
-	cc_*_c) $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;    \
-	as_*_S) $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;    \
-	boot*|build*|*cpp_lds_S|dtc|host*|vdso*) : ;;                        \
-	*) echo "Don't know how to preprocess $(1)" >&2; false ;;            \
+	  cc_*_c|cpp_i_c)                                                    \
+	    $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;        \
+	  as_*_S|cpp_s_S)                                                    \
+	    $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;        \
+	  boot*|build*|*cpp_lds_S|dtc|host*|vdso*) : ;;                      \
+	  *) echo "Don't know how to preprocess $(1)" >&2; false ;;          \
 	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
 
 cmd_and_fixdep =                                                             \
