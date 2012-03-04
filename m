Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:46055 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755692Ab2CDWJX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 Mar 2012 17:09:23 -0500
Received: by dadp12 with SMTP id p12so4191532dad.11
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Mar 2012 14:09:23 -0800 (PST)
Date: Sun, 4 Mar 2012 14:09:20 -0800 (PST)
From: David Rientjes <rientjes@google.com>
Subject: randconfig chosing more than one slab allocator
Message-ID: <alpine.DEB.2.00.1203041404590.18555@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Pekka Enberg <penberg@kernel.org>, Christoph Lameter <cl@linux.com>, linux-kbuild@vger.kernel.org

Hi folks,

make randconfig seems to allow chosing more than one slab allocator 
although they are all part of a choice,endchoice block (and none are 
tristate).  The following quickly finds both CONFIG_SLUB and CONFIG_SLOB 
enabled:

$ while [ 1 ]; do make randconfig &> /dev/null; if [ $(grep "CONFIG_SL[OU]B=y" .config | wc -l) == 2 ]; then break; fi; done
$ grep CONFIG_SL[OU]B=y .config
CONFIG_SLUB=y
CONFIG_SLOB=y

whereas if I do this:

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1063,7 +1063,7 @@ static void randomize_choice_values(struct symbol *csym)
 	expr_list_for_each_sym(prop->expr, e, sym) {
 		if (def == cnt++) {
 			sym->def[S_DEF_USER].tri = yes;
-			csym->def[S_DEF_USER].val = sym;
+//			csym->def[S_DEF_USER].val = sym;
 		}
 		else {
 			sym->def[S_DEF_USER].tri = no;

then it never happens and the "while [ 1 ]; done" loop above never 
returns.

I haven't investigated it yet, but thought I'd bring it up because it 
often creates invalid configs.

Thanks.
