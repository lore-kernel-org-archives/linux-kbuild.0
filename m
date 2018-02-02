Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:52550 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752100AbeBBQVW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:21:22 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5/7] [HACK] avoid gcc-8 ICE on LTO
Date: Fri,  2 Feb 2018 17:21:02 +0100
Message-Id: <20180202162104.2300532-5-arnd@arndb.de>
In-Reply-To: <20180202161550.2106846-1-arnd@arndb.de>
References: <20180202161550.2106846-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

I ran into a build error:

/git/arm-soc/net/sctp/sm_sideeffect.c: In function 'sctp_do_sm':
/git/arm-soc/net/sctp/sm_sideeffect.c:1155:5: internal compiler error: Segmentation fault
 int sctp_do_sm(struct net *net, enum sctp_event event_type,
     ^
0xa42b7f crash_signal

The bug is fixed in mainline gcc now, but I carry this as I have
not yet upgrade.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84105
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 net/sctp/sm_sideeffect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index b71e7fb0a20a..d211863fad48 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -1152,12 +1152,12 @@ static void sctp_cmd_send_asconf(struct sctp_association *asoc)
  * If you want to understand all of lksctp, this is a
  * good place to start.
  */
+typedef const char *(printfn_t)(union sctp_subtype);
 int sctp_do_sm(struct net *net, enum sctp_event event_type,
 	       union sctp_subtype subtype, enum sctp_state state,
 	       struct sctp_endpoint *ep, struct sctp_association *asoc,
 	       void *event_arg, gfp_t gfp)
 {
-	typedef const char *(printfn_t)(union sctp_subtype);
 	static printfn_t *table[] = {
 		NULL, sctp_cname, sctp_tname, sctp_oname, sctp_pname,
 	};
-- 
2.9.0

