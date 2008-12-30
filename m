Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:35600 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750886AbYL3JVP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Dec 2008 04:21:15 -0500
Date: Tue, 30 Dec 2008 10:22:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Do we really need file `all'?
Message-ID: <20081230092249.GA27321@uranus.ravnborg.org>
References: <df9815e70812292217p65b6285eo7a7909c0f6899e6e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df9815e70812292217p65b6285eo7a7909c0f6899e6e@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jike Song <albcamus@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, Dec 30, 2008 at 02:17:26PM +0800, Jike Song wrote:
> Hi Sam,
> 
>  In commit a680eedc6c621c75695c68198533fc3c98f4053b you introduced the
> following code:
> 
>         exuberant()
>         {
>                 all_sources > all
>                 all_sources | xargs ....{snip}...
> 
> This will generate a regular file named `all' in the repository, which
> is not included in .gitignore.
> Do we really need this file? I think the second run of all_source is
> enough.  Or otherwise should
> we add it into .gitignore?
> 
> I'm not subscribing linux-kbuild list so please CC me in replies, thanks.

Thanks for the report. I have queued following fix:

	Sam

From da20e8358e3408a208a2a7056eaff550c8644c9d Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Tue, 30 Dec 2008 10:20:08 +0100
Subject: [PATCH] kbuild: drop debugging leftover in tags.sh

Noticed by Jike.

Reported-by: "Jike Song" <albcamus@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/tags.sh |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 4e75472..9e3451d 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -84,7 +84,6 @@ docscope()
 
 exuberant()
 {
-	all_sources > all
 	all_sources | xargs $1 -a                               \
 	-I __initdata,__exitdata,__acquires,__releases          \
 	-I __read_mostly,____cacheline_aligned                  \
-- 
1.6.0.2.GIT

