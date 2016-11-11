Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:39324 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755879AbcKKI60 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Nov 2016 03:58:26 -0500
From: Adam Borowski <kilobyte@angband.pl>
Date: Fri, 11 Nov 2016 09:55:57 +0100
Message-Id: <20161111085557.13424-1-kilobyte@angband.pl>
In-Reply-To: <CAAqcGHmx-CNLqwDDBS31rB1GC2TikW101sNbfAseNzV5CcxLQQ@mail.gmail.com>
References: <CAAqcGHmx-CNLqwDDBS31rB1GC2TikW101sNbfAseNzV5CcxLQQ@mail.gmail.com>
Subject: [PATCH reworded] builddeb: fix cross-building to arm64 producing host-arch debs
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Riku Voipio <riku.voipio@linaro.org>
Cc: Adam Borowski <kilobyte@angband.pl>

Both Debian and kernel archs are "arm64" but UTS_MACHINE and gcc say
"aarch64".  Recognizing just the latter should be enough but let's
accept both in case something regresses again or an user sets
UTS_MACHINE=arm64.

Regressed in cfa88c7: arm64: Set UTS_MACHINE in the Makefile.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
Acked-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8ea9fd2..3c575cd0 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -51,7 +51,7 @@ set_debarch() {
 		debarch=hppa ;;
 	mips*)
 		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
-	arm64)
+	aarch64|arm64)
 		debarch=arm64 ;;
 	arm*)
 		if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
-- 
2.10.2

Riku Voipio wrote:
> On 10 November 2016 at 13:04, Michal Marek <mmarek@suse.com> wrote:
> >
> > UTS_MACHINE is now always aarch64 on this architecture, so maybe stop
> matching "arm64" to avoid confusion?
>
> I was wondering if it might makes sense to keep the arm64 around for a
> while, for example if someone reverts the UTS_MACHINE setting patch
> from arch/arm64 for unrelated reasons and still tries to build a deb.
> But I guess that's a corner case, and it's indeed cleaner without the
> arm64 bit. So either way works for me.

I think that it's better to be liberal in what you accept, especially for
something an user might want to override.  It's up to you guys to decide,
though.

Here's a version with no changes but the commit message extended to mention
cfa88c7 and "aarch64" being sufficient.
