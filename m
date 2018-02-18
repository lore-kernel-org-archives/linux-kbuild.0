Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:53869 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751758AbeBRVFW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 16:05:22 -0500
Received: by mail-wm0-f65.google.com with SMTP id t74so11760619wme.3
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Feb 2018 13:05:22 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Sun, 18 Feb 2018 22:05:15 +0100
Subject: Re: [PATCH v3 3/3] kconfig: Print reverse dependencies in groups
Message-ID: <20180218210515.GA13612@example.com>
References: <cover.1518826148.git.erosca@de.adit-jv.com>
 <0ed37972989a9ba7a8b50777bd60ea8f46495a2a.1518826148.git.erosca@de.adit-jv.com>
 <CAFkk2KT8gQz+wmMagq-v4zLX7XuZ6MahN8KQ6SqtaAMRo5o7sA@mail.gmail.com>
 <20180218110702.GA26185@example.com>
 <20180218130246.eqfa46eswut5xwmv@huvuddator>
 <CAFkk2KRvy+jNphg2oFTofRZGCuRKgYy8z3+f9dNopfwftW=K6Q@mail.gmail.com>
 <CAFkk2KT8r8=ovH32zSU4k=SKnj-9zPGec10G4yAQP7o1frXQBg@mail.gmail.com>
 <CAFkk2KQ9FZOBULCRVR=8DJs7sPGfkp5Uv5COCGvUAsoVstPqTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkk2KQ9FZOBULCRVR=8DJs7sPGfkp5Uv5COCGvUAsoVstPqTg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>

Hi Ulf,

Sometimes having so many options (all of them being equally clean,
simple and elegant) can make the choice really hard :D

Below is the interdiff between v3 and v4. Hopefully other people will
also like this series and we will see it in in some weeks. Thank you
very much for your support.

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 48b99371d276..95dc058a236f 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1180,13 +1180,19 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
 }
 
 static void
-expr_print_newline(struct expr *e,
-		   void (*fn)(void *, struct symbol *, const char *),
-		   void *data,
-		   int prevtoken)
+expr_print_revdep(struct expr *e,
+		  void (*fn)(void *, struct symbol *, const char *),
+		  void *data,
+		  int prevtoken,
+		  enum print_type type)
 {
-	fn(data, NULL, "\n  - ");
-	expr_print(e, fn, data, prevtoken);
+	if (type == PRINT_REVDEP_ALL				  ||
+	    type == PRINT_REVDEP_YES && expr_calc_value(e) == yes ||
+	    type == PRINT_REVDEP_MOD && expr_calc_value(e) == mod ||
+	    type == PRINT_REVDEP_NO  && expr_calc_value(e) == no) {
+		fn(data, NULL, "\n  - ");
+		expr_print(e, fn, data, prevtoken);
+	}
 }
 
 static void
@@ -1211,21 +1217,10 @@ __expr_print(struct expr *e,
 				fn(data, e->left.sym, e->left.sym->name);
 				break;
 			case PRINT_REVDEP_ALL:
-				expr_print_newline(e, fn, data, E_OR);
-				break;
 			case PRINT_REVDEP_YES:
-				if (expr_calc_value(e) == yes)
-					expr_print_newline(e, fn, data, E_OR);
-				break;
 			case PRINT_REVDEP_MOD:
-				if (expr_calc_value(e) == mod)
-					expr_print_newline(e, fn, data, E_OR);
-				break;
 			case PRINT_REVDEP_NO:
-				if (expr_calc_value(e) == no)
-					expr_print_newline(e, fn, data, E_OR);
-				break;
-			default:
+				expr_print_revdep(e, fn, data, E_OR, type);
 				break;
 			}
 		else
@@ -1283,21 +1278,10 @@ __expr_print(struct expr *e,
 			expr_print(e->right.expr, fn, data, E_AND);
 			break;
 		case PRINT_REVDEP_ALL:
-			expr_print_newline(e, fn, data, E_OR);
-			break;
 		case PRINT_REVDEP_YES:
-			if (expr_calc_value(e) == yes)
-				expr_print_newline(e, fn, data, E_OR);
-			break;
 		case PRINT_REVDEP_MOD:
-			if (expr_calc_value(e) == mod)
-				expr_print_newline(e, fn, data, E_OR);
-			break;
 		case PRINT_REVDEP_NO:
-			if (expr_calc_value(e) == no)
-				expr_print_newline(e, fn, data, E_OR);
-			break;
-		default:
+			expr_print_revdep(e, fn, data, E_OR, type);
 			break;
 		}
 		break;
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d13ffa69d65b..029da77fe1b0 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -797,19 +797,19 @@ void get_revdep_by_type(struct expr *e, char *s, struct gstr *r)
 
 	if (expr_revdep_contains(e, yes)) {
 		str_append(r, s);
-		str_append(r, _(" [y]:"));
+		str_append(r, " [y]:");
 		expr_gstr_print_revdep(e, r, PRINT_REVDEP_YES);
 		str_append(r, "\n");
 	}
 	if (expr_revdep_contains(e, mod)) {
 		str_append(r, s);
-		str_append(r, _(" [m]:"));
+		str_append(r, " [m]:");
 		expr_gstr_print_revdep(e, r, PRINT_REVDEP_MOD);
 		str_append(r, "\n");
 	}
 	if (expr_revdep_contains(e, no)) {
 		str_append(r, s);
-		str_append(r, _(" [n]:"));
+		str_append(r, " [n]:");
 		expr_gstr_print_revdep(e, r, PRINT_REVDEP_NO);
 		str_append(r, "\n");
 	}


Best regards,
Eugeniu.
