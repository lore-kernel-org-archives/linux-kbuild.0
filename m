Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:53045 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbeK3UZx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Nov 2018 15:25:53 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/5] kconfig: remove k_invalid from expr_parse_string() return type
Date: Fri, 30 Nov 2018 18:15:52 +0900
Message-Id: <1543569352-4899-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543569352-4899-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543569352-4899-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The only possibility of k_invalid being returned was when
expr_parse_sting() parsed S_OTHER type symbol. This actually never
happened, and this is even clearer since S_OTHER has gone.

Clean up unreachable code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/expr.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index e1a39e9..57ebf71 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -980,7 +980,6 @@ enum string_value_kind {
 	k_string,
 	k_signed,
 	k_unsigned,
-	k_invalid
 };
 
 union string_value {
@@ -1011,13 +1010,10 @@ static enum string_value_kind expr_parse_string(const char *str,
 		val->u = strtoull(str, &tail, 16);
 		kind = k_unsigned;
 		break;
-	case S_STRING:
-	case S_UNKNOWN:
+	default:
 		val->s = strtoll(str, &tail, 0);
 		kind = k_signed;
 		break;
-	default:
-		return k_invalid;
 	}
 	return !errno && !*tail && tail > str && isxdigit(tail[-1])
 	       ? kind : k_string;
@@ -1073,13 +1069,7 @@ tristate expr_calc_value(struct expr *e)
 
 	if (k1 == k_string || k2 == k_string)
 		res = strcmp(str1, str2);
-	else if (k1 == k_invalid || k2 == k_invalid) {
-		if (e->type != E_EQUAL && e->type != E_UNEQUAL) {
-			printf("Cannot compare \"%s\" and \"%s\"\n", str1, str2);
-			return no;
-		}
-		res = strcmp(str1, str2);
-	} else if (k1 == k_unsigned || k2 == k_unsigned)
+	else if (k1 == k_unsigned || k2 == k_unsigned)
 		res = (lval.u > rval.u) - (lval.u < rval.u);
 	else /* if (k1 == k_signed && k2 == k_signed) */
 		res = (lval.s > rval.s) - (lval.s < rval.s);
-- 
2.7.4
