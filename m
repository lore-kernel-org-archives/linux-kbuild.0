Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f73.google.com ([209.85.161.73]:52362 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729835AbfICPHm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 11:07:42 -0400
Received: by mail-yw1-f73.google.com with SMTP id d18so13594794ywb.19
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2019 08:07:41 -0700 (PDT)
Date: Tue,  3 Sep 2019 16:06:32 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-7-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
Subject: [PATCH v4 06/12] export: allow definition default namespaces in
 Makefiles or sources
From: Matthias Maennich <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com, maennich@google.com, arnd@arndb.de, gregkh@linuxfoundation.org, jeyu@kernel.org, joel@joelfernandes.org, lucas.de.marchi@gmail.com, maco@android.com, sspatil@google.com, will@kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, linux-watchdog@vger.kernel.org

To avoid excessive usage of EXPORT_SYMBOL_NS(sym, MY_NAMESPACE), where
MY_NAMESPACE will always be the namespace we are exporting to, allow
exporting all definitions of EXPORT_SYMBOL() and friends by defining
DEFAULT_SYMBOL_NAMESPACE.

For example, to export all symbols defined in usb-common into the
namespace USB_COMMON, add a line like this to drivers/usb/common/Makefile:

  ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_COMMON

That is equivalent to changing all EXPORT_SYMBOL(sym) definitions to
EXPORT_SYMBOL_NS(sym, USB_COMMON). Subsequently all symbol namespaces
functionality will apply.

Another way of making use of this feature is to define the namespace
within source or header files similar to how TRACE_SYSTEM defines are
used:
  #undef DEFAULT_SYMBOL_NAMESPACE
  #define DEFAULT_SYMBOL_NAMESPACE USB_COMMON

Please note that, as opposed to TRACE_SYSTEM, DEFAULT_SYMBOL_NAMESPACE
has to be defined before including include/linux/export.h.

If DEFAULT_SYMBOL_NAMESPACE is defined, a symbol can still be exported
to another namespace by using EXPORT_SYMBOL_NS() and friends with
explicitly specifying the namespace.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Martijn Coenen <maco@android.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 include/linux/export.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/export.h b/include/linux/export.h
index d59461e71478..2c5468d8ea9a 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -166,6 +166,12 @@ struct kernel_symbol {
 #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
 #endif
 
+#ifdef DEFAULT_SYMBOL_NAMESPACE
+#undef __EXPORT_SYMBOL
+#define __EXPORT_SYMBOL(sym, sec)				\
+	__EXPORT_SYMBOL_NS(sym, sec, DEFAULT_SYMBOL_NAMESPACE)
+#endif
+
 #define EXPORT_SYMBOL(sym) __EXPORT_SYMBOL(sym, "")
 #define EXPORT_SYMBOL_GPL(sym) __EXPORT_SYMBOL(sym, "_gpl")
 #define EXPORT_SYMBOL_GPL_FUTURE(sym) __EXPORT_SYMBOL(sym, "_gpl_future")
-- 
2.23.0.187.g17f5b7556c-goog
