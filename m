Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:53783 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985AbcE0MdS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 May 2016 08:33:18 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] kbuild updates for v4.7-rc1
Date: Fri, 27 May 2016 14:33:05 +0200
Message-ID: <5345273.JScMX9oohG@wuerfel>
In-Reply-To: <CA+55aFzQxws_ipKZhV9cFrJdV8CvKy=m9AxGe5cjM=FYceNbZQ@mail.gmail.com>
References: <20160526203346.GA4734@pobox.suse.cz> <CA+55aFzQxws_ipKZhV9cFrJdV8CvKy=m9AxGe5cjM=FYceNbZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.com>, mussitantesmortem@gmail.com, nicolas.ferre@atmel.com, Nicolas Pitre <nicolas.pitre@linaro.org>, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>

On Thursday, May 26, 2016 10:26:50 PM CEST Linus Torvalds wrote:
> On Thu, May 26, 2016 at 1:33 PM, Michal Marek <mmarek@suse.com> wrote:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild
> 
> This pull results in new warnings.
> 
> I get new "may be uninitialized" warnings now for me allmodconfig
> build, and while I didn't look at them all, the one I looked at was
> just entirely crap:
> 
>    fs/gfs2/dir.c: In function ‘dir_split_leaf.isra.16’:
>    fs/gfs2/dir.c:1021:8: warning: ‘leaf_no’ may be used uninitialized
> in this function [-Wmaybe-uninitialized]
>      error = get_leaf(dip, leaf_no, &obh);
>            ^
> 
> yeah no, leaf_no is initialized a few lines up by
> 
>         error = get_leaf_nr(dip, index, &leaf_no);
> 
> and the fact that gcc can't follow the trivial  error handling is not
> our fault. It looks *so* trivial that I wonder why.
> 
> That said, I don't see exactly what in the pull request causes this.
>
> My reading of the diff seems to say that you are actually adding
> *more* cases of -Wno-maybe-uninitialized, not less.

I put the explanation for this into the individual patch commit logs.

> So I suspect it's almost accidental in just how the Kconfig option
> CC_OPTIMIZE_FOR_PERFORMANCE happened, which in turn probably just
> changes the options for "make allmiodconfig", and it now picks a
> non-size-optimized build that always showed those warnings and I just
> didn't see them.

Correct, the point of the CC_OPTIMIZE_FOR_PERFORMANCE change is that
we now see the -Wmaybe-uninitialized warnings by default now. I also
submitted patches for all warnings I saw a while ago, but some only
happen with certain compiler versions that I don't regularly test on,
or are architecture specific.

The specific gfs2 warning is one that I fixed before but it came
back after some back-and-forth discussions, and I forgot to post
it again but kept it in my tree of backlog warning fixes, my
mistake. 

I keep running into new valid Wmaybe-uninitialized warnings on
randconfig builds, e.g. https://lkml.org/lkml/2016/5/27/99 today,
and having them enabled in allmodconfig should make it easier for
patch authors to catch them first.

I don't currently get any other -Wmaybe-uninialized warnings using
gcc-6 on ARM, but I get two warnings on x86, in
drivers/net/wireless/wl3501_cs.c and
drivers/net/wireless/intel/iwlwifi/mvm/nvm.c

I'll have a look at those.

	Arnd

8<----
[PATCH] gfs2: avoid maybe-uninitialized warning again

gcc can not always figure out which code is only used in an error
condition an assignment to indirect argument is only done after the
use of IS_ERR() catches errors. In gfs2, this results in a warning
about correct code:

fs/gfs2/dir.c: In function 'get_first_leaf':
fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/gfs2/dir.c: In function 'dir_split_leaf':
fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]

I managed to work around this earlier using the IS_ERR_VALUE(),
but unfortunately that did not catch all configurations.
This new patch reworks the function in question to us
PTR_ERR_OR_ZERO() instead, which makes it more obvious to the
compiler what happens, and should also result in better object
code.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 67893f12e537 ("gfs2: avoid uninitialized variable warning")

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index 4a01f30e9995..271d93905bac 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -783,12 +783,15 @@ static int get_leaf_nr(struct gfs2_inode *dip, u32 index,
 		       u64 *leaf_out)
 {
 	__be64 *hash;
+	int error;
 
 	hash = gfs2_dir_get_hash_table(dip);
-	if (IS_ERR(hash))
-		return PTR_ERR(hash);
-	*leaf_out = be64_to_cpu(*(hash + index));
-	return 0;
+	error = PTR_ERR_OR_ZERO(hash);
+
+	if (!error)
+		*leaf_out = be64_to_cpu(*(hash + index));
+
+	return error;
 }
 
 static int get_first_leaf(struct gfs2_inode *dip, u32 index,
@@ -798,7 +801,7 @@ static int get_first_leaf(struct gfs2_inode *dip, u32 index,
 	int error;
 
 	error = get_leaf_nr(dip, index, &leaf_no);
-	if (!IS_ERR_VALUE(error))
+	if (!error)
 		error = get_leaf(dip, leaf_no, bh_out);
 
 	return error;
@@ -1014,7 +1017,7 @@ static int dir_split_leaf(struct inode *inode, const struct qstr *name)
 
 	index = name->hash >> (32 - dip->i_depth);
 	error = get_leaf_nr(dip, index, &leaf_no);
-	if (IS_ERR_VALUE(error))
+	if (error)
 		return error;
 
 	/*  Get the old leaf block  */

