Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:43896 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932488AbeCLUyz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Mar 2018 16:54:55 -0400
Received: by mail-qk0-f195.google.com with SMTP id j4so13055593qke.10
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Mar 2018 13:54:55 -0700 (PDT)
Date: Mon, 12 Mar 2018 16:54:52 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
In-Reply-To: <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1803121627290.28583@knanqh.ubzr>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com> <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thomas Lindroth <thomas.lindroth@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, 13 Mar 2018, Masahiro Yamada wrote:

> 2018-03-05 22:07 GMT+09:00 Thomas Lindroth <thomas.lindroth@gmail.com>:
> > As I understand it TRIM_UNUSED_KSYMS will build the kernel and 
> > modules, then check which symbols are used by the modules and remove 
> > all unused EXPORT_SYMBOL_* from the kernel and rebuild it again. 
> >
> > EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
> > EXPORT_SYMBOL_GPL(pci_user_write_config_##size);
> > 
> > drivers/pci/access.c got these two exports. They stand out because 
> > they are macros instead of functions.

I propose the following patch to clear up doubts about the most obscure 
part of the build for which there is currently no direct visibility, 
which is the actual extraction of exported symbols.

---- >8
Subject: kbuild: show the list of exported symbols with V=1 for TRIM_UNUSED_KSYMS

When CONFIG_TRIM_UNUSED_KSYMS=y the list of exported symbols is 
extracted from the source code and piped directly into the fixdep tool. 
Because of that, there is no direct way of obtaining that list to make 
sure it is correct when debugging related issues.

Let's log that list of symbols when the verbosity level is set to 1.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 9ffd3dda38..141a63787b 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -298,6 +298,7 @@ ksym_dep_filter =                                                            \
 
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
+	$(if $(findstring 1,$(KBUILD_VERBOSE)), $(ksym_dep_filter);)         \
 	$(ksym_dep_filter) |                                                 \
 		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
 			> $(dot-target).tmp;	                             \
