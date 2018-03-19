Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from m12-11.163.com ([220.181.12.11]:41293 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932257AbeCSMKD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Mar 2018 08:10:03 -0400
From: yuan linyu <cugyly@163.com>
Subject: [PATCH kconfig] kconfig: lxdialog: clean string input with whitespace
Date: Mon, 19 Mar 2018 20:09:07 +0800
Message-Id: <20180319120907.5108-1-cugyly@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>

From: yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>

remove leading/trailing whitespace and all whitespace

Signed-off-by: yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>
---
 scripts/kconfig/lxdialog/inputbox.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index d58de1dc5360..647a9dcb8710 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -38,6 +38,31 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
 	wrefresh(dialog);
 }
 
+static void dialog_input_clean(void)
+{
+	char *instr = dialog_input_result;
+	int l, s, e;
+
+	l = strlen(instr);
+	if (l == 0)
+		return;
+	for (s = 0; s < l; s++) {
+		if (instr[s] != ' ')
+			break;
+		instr[s] = '\0';
+	}
+	if (s == l)
+		return;
+	for (e = l - 1; e > 0; e--) {
+		if (instr[e] != ' ')
+			break;
+		instr[e] = '\0';
+	}
+	if (s == 0)
+		return;
+	memmove(instr, instr + s, e - s + 2);
+}
+
 /*
  * Display a dialog box for inputing a string
  */
@@ -234,6 +259,7 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 		case 'O':
 		case 'o':
 			delwin(dialog);
+			dialog_input_clean();
 			return 0;
 		case 'H':
 		case 'h':
@@ -281,6 +307,7 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 		case ' ':
 		case '\n':
 			delwin(dialog);
+			dialog_input_clean();
 			return (button == -1 ? 0 : button);
 		case 'X':
 		case 'x':
-- 
2.14.1


