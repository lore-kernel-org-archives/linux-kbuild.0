Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:39583 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456Ab1HPFTl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2011 01:19:41 -0400
Received: by gya6 with SMTP id 6so3592578gya.19
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Aug 2011 22:19:40 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: protect locale-unsafe calls
Date: Tue, 16 Aug 2011 01:19:33 -0400
Message-Id: <1313471973-13966-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: s.koylux@gmail.com, Arnaud Lacombe <lacombar@gmail.com>

There is a few calls in kconfig where we end-up using tolower(3) or toupper(3)
in an unsafe manner. As highlighted by Serdar, it would seem that Turkish's
locale do not have representable lowercase for the Engligh capital-dotless-i.

Introduces locale-safe portion in the backend where we reset the local to the
default "C".

Reported-by: Serdar KÖYLÜ <s.koylux@gmail.com>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/confdata.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 5a58965..7b1bbb8 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -828,6 +828,8 @@ static int conf_split_config(void)
 	if (chdir("include/config"))
 		return 1;
 
+	setlocale(LC_ALL, "C");
+
 	res = 0;
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
@@ -918,6 +920,9 @@ static int conf_split_config(void)
 		}
 		close(fd);
 	}
+
+	setlocale(LC_ALL, "");
+
 out:
 	if (chdir("../.."))
 		return 1;
@@ -956,6 +961,8 @@ int conf_write_autoconf(void)
 		return 1;
 	}
 
+	setlocale(LC_ALL, "C");
+
 	conf_write_heading(out, &kconfig_printer_cb, NULL);
 
 	conf_write_heading(tristate, &tristate_printer_cb, NULL);
@@ -979,6 +986,9 @@ int conf_write_autoconf(void)
 
 		conf_write_symbol(out_h, sym, &header_printer_cb, NULL);
 	}
+
+	setlocale(LC_ALL, "");
+
 	fclose(out);
 	fclose(tristate);
 	fclose(out_h);
-- 
1.7.6.153.g78432

