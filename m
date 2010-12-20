Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60337 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757947Ab0LTPLu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Dec 2010 10:11:50 -0500
Date: Mon, 20 Dec 2010 16:11:48 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCHv2] kconfig: simplify select-with-unmet-direct-dependency
 warning
Message-ID: <20101220151148.GC20492@sepie.suse.cz>
References: <1291663669-13077-1-git-send-email-lacombar@gmail.com>
 <20101220151047.GB20492@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20101220151047.GB20492@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

On Mon, Dec 20, 2010 at 04:10:47PM +0100, Michal Marek wrote:
> On Mon, Dec 06, 2010 at 02:27:49PM -0500, Arnaud Lacombe wrote:
> > Hi,
> > 
> > This is an updated version of the patch I sent in mid-September to simplify the
> > unmet dependency warnings.
> > 
> >  - Arnaud
> > 
> > ---
> > 
> > This is an attempt to simplify the expressing printed by kconfig when a
> > symbol is selected but still has direct unmet dependency.
> > 
> > First, the symbol reverse dependency is split in sub-expression. Then,
> > each sub-expression is checked to ensure that it does not contains the
> > unmet dependency. This removes all the false-positive symbols which
> > already have the correct dependency. Finally, only the symbol doing the
> > "select" is printed, instead of the full dependency tree.
> > 
> > CC: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> > ---
> >  scripts/kconfig/expr.c      |   35 ++++++++++++++++++++++++++++++++++-
> >  scripts/kconfig/lkc_proto.h |    2 +-
> >  scripts/kconfig/symbol.c    |    6 +++++-
> >  3 files changed, 40 insertions(+), 3 deletions(-)
> 
> I applied this to kbuild-2.6.git#kconfig now. If someone encounters a
> warning that hides the actual culprit due to this patch, we will have to
> solve it somehow, but otherwise these simplified expressions are wanted
> IMO.

BTW, this called for a minor warning fix:


From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH] kconfig: Make expr_copy() take a const argument

Fixes
scripts/kconfig/expr.c: In function ‘expr_get_leftmost_symbol’:
scripts/kconfig/expr.c:1026:2: warning: passing argument 1 of ‘expr_copy’ discards qualifiers from pointer target type
scripts/kconfig/expr.c:67:14: note: expected ‘struct expr *’ but argument is of type ‘const struct expr *’

Signed-off-by: Michal Marek <mmarek@suse.cz>

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 65531a7..0010034 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -64,7 +64,7 @@ struct expr *expr_alloc_or(struct expr *e1, struct expr *e2)
 	return e2 ? expr_alloc_two(E_OR, e1, e2) : e1;
 }
 
-struct expr *expr_copy(struct expr *org)
+struct expr *expr_copy(const struct expr *org)
 {
 	struct expr *e;
 
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index b267933..76ee319 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -193,7 +193,7 @@ struct expr *expr_alloc_two(enum expr_type type, struct expr *e1, struct expr *e
 struct expr *expr_alloc_comp(enum expr_type type, struct symbol *s1, struct symbol *s2);
 struct expr *expr_alloc_and(struct expr *e1, struct expr *e2);
 struct expr *expr_alloc_or(struct expr *e1, struct expr *e2);
-struct expr *expr_copy(struct expr *org);
+struct expr *expr_copy(const struct expr *org);
 void expr_free(struct expr *e);
 int expr_eq(struct expr *e1, struct expr *e2);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
