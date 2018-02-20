Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:37334 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751000AbeBTPAd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 10:00:33 -0500
Received: by mail-lf0-f66.google.com with SMTP id y19so4616251lfd.4
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2018 07:00:32 -0800 (PST)
Date: Tue, 20 Feb 2018 16:00:18 +0100
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Message-ID: <20180220150018.mjyjmdmao7xqyukr@huvuddator>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
 <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Feb 20, 2018 at 05:24:01PM +0900, Masahiro Yamada wrote:
> 2018-02-20 17:13 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > 2018-02-19 5:47 GMT+09:00 Eugeniu Rosca <roscaeugeniu@gmail.com>:
> >> From: Eugeniu Rosca <erosca@de.adit-jv.com>
> >>
> >> Hello Masahiro, Ulf, Petr and all,
> >>
> >> Here are a few words about the motivation behind this patch series.
> >>
> >> First, the reason I got in touch with Kconfig is to optimize the
> >> configuration of automotive kernels, as well as to align the kernel
> >> configuration across a number of platforms. In the context of kernel
> >> optimization, one of the primary goals is to filter out any features
> >> that are not mentioned in the platform requirements.
> >>
> >> Surprisingly or not, disabling a CONFIG option (which is assumed to
> >> be unneeded) may be not so trivial. Especially it is not trivial, when
> >> this CONFIG option is selected by a dozen of other configs. Before the
> >> moment commit 1ccb27143360 ("kconfig: make "Selected by:" and
> >> "Implied by:" readable") was submitted by Petr and eventually popped
> >> up in v4.16-rc1, it was an absolute pain to break down the "Selected by"
> >> reverse dependency expression in order to identify all those configs
> >> which select (IOW *do not allow disabling*) a certain feature (assumed
> >> to be not needed).
> >>
> >> This patch series tries to make one step further and puts at users'
> >> fingertips the revdep top level OR sub-expressions grouped/clustered by
> >> the tristate value they evaluate to. This should allow the users to
> >> directly concentrate on and tackle the active reverse dependencies,
> >> which imho are the only ones that matter for a given ARCH and for a
> >> given defconfig (nevertheless we still print all of them).
> >>
> >> Changes v3->v4 (fixed review findings from Ulf):
> >> - Remove redundant default cases in switch constructs.
> >> - Remove gettext _() tokens in str_append() calls.
> >> - Aggregate code repetitions in expr_print_revdep().
> >>
> >> Changes v2->v3:
> >> - Switch from reverse dependencies prefixed by their tristate value to
> >>   reverse dependencies grouped by the tristate value they evaluate to.
> >> - Skip printing "{Selected,Implied} by [y|m|n]:" if there are no top
> >>   level OR tokens/sub-expressions that evaluate to y|m|n (suggested
> >>   by Petr).
> >> - Use [1] as template for updating the interface/prototype of
> >>   __expr_print() (suggested by Ulf).
> >>
> >> Changes v1->v2:
> >> - Don't skip the =n reverse dependency OR tokens, since some users might
> >>   still need this information (suggested by Ulf).
> >> - Instead of using "Selected by" for active tokens only, use it for all
> >>   OR tokens, but specify the tristate value of each token as prefix
> >>   (suggested by Masahiro).
> >>
> >> [1] https://marc.info/?l=linux-kbuild&m=151777006005199&w=4
> >>
> >> Eugeniu Rosca (3):
> >>   kconfig: Print reverse dependencies on new line consistently
> >>   kconfig: Prepare for printing reverse dependencies in groups
> >>   kconfig: Print reverse dependencies in groups
> >>
> >>  scripts/kconfig/expr.c      | 102 +++++++++++++++++++++++++++++++++++++-------
> >>  scripts/kconfig/expr.h      |  11 ++++-
> >>  scripts/kconfig/lkc_proto.h |   1 +
> >>  scripts/kconfig/menu.c      |  37 +++++++++++-----
> >>  4 files changed, 124 insertions(+), 27 deletions(-)
> >>
> >
> >
> > I do not like this implementation.
> > The code is super ugly, the diff-stat is too much than needed.
> >
> > Please rewrite the code within 20 lines.
> >
> 
> For a hint, I cleaned up the code base.
> https://patchwork.kernel.org/patch/10229545/
> 
> which should be equivalent to yours:
> https://patchwork.kernel.org/patch/10226951/
> 
> 
> No 'enum print_type', please.

The reason I prefer them on separate lines consistently is to avoid stuff like the following:

  Selected by [y]: MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
  Selected by [n]:
  - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || ...
  - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
  - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64

That looks confusing and unbalanced to me.

There are some simple ways to trim down the size of this patchset
though.

Eugeniu:
What do you think about the following refactoring of your 3/3 patch?
Maybe there's a way to have expr_print_revdep() take just a tristate
too, though it's not worth it if it just grows the code elsewhere.

(By the way, I noticed that expr_print_revdep() previously generated a
warning suggesting parentheses, which was my fault. If you saw that,
don't copy my mistakes. The build should be warning-free. :)


diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 95dc058a236f..db9a89b9bede 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1186,10 +1186,9 @@ expr_print_revdep(struct expr *e,
 		  int prevtoken,
 		  enum print_type type)
 {
-	if (type == PRINT_REVDEP_ALL				  ||
-	    type == PRINT_REVDEP_YES && expr_calc_value(e) == yes ||
-	    type == PRINT_REVDEP_MOD && expr_calc_value(e) == mod ||
-	    type == PRINT_REVDEP_NO  && expr_calc_value(e) == no) {
+	if ((type == PRINT_REVDEP_YES && expr_calc_value(e) == yes) ||
+	    (type == PRINT_REVDEP_MOD && expr_calc_value(e) == mod) ||
+	    (type == PRINT_REVDEP_NO  && expr_calc_value(e) == no)) {
 		fn(data, NULL, "\n  - ");
 		expr_print(e, fn, data, prevtoken);
 	}
@@ -1212,17 +1211,10 @@ __expr_print(struct expr *e,
 	switch (e->type) {
 	case E_SYMBOL:
 		if (e->left.sym->name)
-			switch (type) {
-			case PRINT_NORMAL:
+			if (type == PRINT_NORMAL)
 				fn(data, e->left.sym, e->left.sym->name);
-				break;
-			case PRINT_REVDEP_ALL:
-			case PRINT_REVDEP_YES:
-			case PRINT_REVDEP_MOD:
-			case PRINT_REVDEP_NO:
+			else
 				expr_print_revdep(e, fn, data, E_OR, type);
-				break;
-			}
 		else
 			fn(data, NULL, "<choice>");
 		break;
@@ -1271,18 +1263,12 @@ __expr_print(struct expr *e,
 		__expr_print(e->right.expr, fn, data, E_OR, type);
 		break;
 	case E_AND:
-		switch (type) {
-		case PRINT_NORMAL:
+		if (type == PRINT_NORMAL) {
 			expr_print(e->left.expr, fn, data, E_AND);
 			fn(data, NULL, " && ");
 			expr_print(e->right.expr, fn, data, E_AND);
-			break;
-		case PRINT_REVDEP_ALL:
-		case PRINT_REVDEP_YES:
-		case PRINT_REVDEP_MOD:
-		case PRINT_REVDEP_NO:
+		} else {
 			expr_print_revdep(e, fn, data, E_OR, type);
-			break;
 		}
 		break;
 	case E_LIST:
@@ -1370,27 +1356,14 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
  */
 bool expr_revdep_contains(struct expr *e, tristate val)
 {
-	bool ret = false;
-
 	if (!e)
-		return ret;
+		return false;
 
-	switch (e->type) {
-	case E_SYMBOL:
-	case E_AND:
-		if (expr_calc_value(e) == val)
-			ret = true;
-		break;
-	case E_OR:
-		if (expr_revdep_contains(e->left.expr, val))
-			ret = true;
-		else if (expr_revdep_contains(e->right.expr, val))
-			ret = true;
-		break;
-	default:
-		break;
-	}
-	return ret;
+	if (e->type == E_OR)
+		return expr_revdep_contains(e->left.expr, val) ||
+		       expr_revdep_contains(e->right.expr, val);
+
+	return expr_calc_value(e) == val;
 }
 
 /*
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index d5b096725ca8..e5687b430c17 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -36,7 +36,6 @@ enum expr_type {
 
 enum print_type {
 	PRINT_NORMAL,
-	PRINT_REVDEP_ALL,
 	PRINT_REVDEP_YES,
 	PRINT_REVDEP_MOD,
 	PRINT_REVDEP_NO,
