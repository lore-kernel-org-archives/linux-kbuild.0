Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33385 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbbJEUtn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Oct 2015 16:49:43 -0400
Date: Mon, 5 Oct 2015 13:49:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] builddeb: remove debian/files before build
Message-Id: <20151005134942.2f648b39dd039e24fb613777@linux-foundation.org>
In-Reply-To: <CAAqcGHk28JMuMhp=yTuzTvS6OeVKX8wCR7SW1xFG21vA=t+YQg@mail.gmail.com>
References: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>
	<1442858954.3511.1.camel@decadent.org.uk>
	<87oagun1ax.fsf@kamboji.qca.qualcomm.com>
	<002801d0ff09$a23930f0$e6ab92d0$@net>
	<CAAqcGHk28JMuMhp=yTuzTvS6OeVKX8wCR7SW1xFG21vA=t+YQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: mmarek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Ben Hutchings <ben@decadent.org.uk>, Doug Smythies <dsmythies@telus.net>

On Mon, 5 Oct 2015 15:39:40 +0300 Riku Voipio <riku.voipio@linaro.org> wrote:

> On 5 October 2015 at 04:03, Doug Smythies <dsmythies@telus.net> wrote:
> > On 2015.09.22 04:25 Kalle Valo wrote:
> >> Ben Hutchings <ben@decadent.org.uk> writes:
> >>> On Tue, 2015-09-15 at 21:11 +0300, riku.voipio@linaro.org wrote:
> >>>> From: Riku Voipio <riku.voipio@linaro.org>
> >>>>
> >>>> As debian/files keeps accumulating entries, the changes file
> >>>> will end up growing indefinelty. Remove the file in clean
> >>>> rule and before build starts.
> >>>>
> >>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> >>>> Reported-by: Doug Smythies <dsmythies@telus.net>
> >>> [...]
> >>>
> >>> FWIW:
> >>>
> >>> Acked-by: Ben Hutchings <ben@decadent.org.uk>
> >>
> >> Marek, this is a pretty annoying regression. Is it possible to get this
> >> to 4.3?
> >
> > Perhaps I do not understand the process here, but having reported the issue
> > within a day of kernel 4.3-rc1 being released, and then what seems to be an
> > acceptable patch being suggested, and tested, with plenty of time to make
> > into -rc2, why hasn't it been included yet (-rc4)?
> 
> Hi Andrew,
> 
> Could you pass this patch in your series, as the regression doesn't
> seem to be getting through via the maintainer. It would be
> embarrassing to have it in 4.3 since it was reported and fixed timely.
> The  patch is at:
> 
> http://permalink.gmane.org/gmane.linux.kbuild.devel/13710
> 
> Tests and acks at:
> 
> http://comments.gmane.org/gmane.linux.kbuild.devel/13710

I'm not subscribed to linux-kbuild and the browser won't do
save-as-text, so I typed it all in again.  Please check the below.

I'll put this in my mainline-later queue, which means I'll send it
Linuswards next week if it doesn't pop up in linux-next before then.

The changelog doesn't actually describe this patch as a regression fix.
It makes the patch look like a regular old bugfix.  And the changelog
doesn't describe the severity of the bug either.  Please do pay
attention to such details to guide others in deciding which kernel
version(s) need fixing.


From: Riku Voipio <riku.voipio@linaro.org>
Subject: builddeb: remove debian/files before build

As debian/files keeps accumulating entries, the changes file will end up
growing indefinelty.  Remove the file in clean rule and before build
starts.

Fixes: 3716001bcb7f ("deb-pkg: add source package")
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
Reported-by: Doug Smythies <dsmythies@telus.net>
Tested-by: Doug Smythies <dsmythies@telus.net>
Tested-by: Kalle Valo <kvalo@codeaurora.org>
Acked-by: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>
Cc: maximilian attems <maks@stro.at>
Cc: Chris J Arges <chris.j.arges@canonical.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/package/builddeb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/package/builddeb~a scripts/package/builddeb
--- a/scripts/package/builddeb~a
+++ a/scripts/package/builddeb
@@ -115,7 +115,7 @@ esac
 BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir"
+rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" $objtree/debian/files
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
 mkdir -p "$fwdir/lib/firmware/$version/"
@@ -408,7 +408,7 @@ binary-arch:
 	\$(MAKE) KDEB_SOURCENAME=${sourcename} KDEB_PKGVERSION=${packageversion} bindeb-pkg
 
 clean:
-	rm -rf debian/*tmp
+	rm -rf debian/*tmp debian/files
 	mv debian/ debian.backup # debian/ might be cleaned away
 	\$(MAKE) clean
 	mv debian.backup debian
_

