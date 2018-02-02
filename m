Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0143.hostedemail.com ([216.40.44.143]:35871 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753236AbeBBRKU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 12:10:20 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id B21561800BC4C
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Feb 2018 17:05:00 +0000 (UTC)
Message-ID: <1517591094.7489.103.camel@perches.com>
Subject: Re: [PATCH 5/7] [HACK] avoid gcc-8 ICE on LTO
From: Joe Perches <joe@perches.com>
Date: Fri, 02 Feb 2018 09:04:54 -0800
In-Reply-To: <20180202162104.2300532-5-arnd@arndb.de>
References: <20180202161550.2106846-1-arnd@arndb.de>
         <20180202162104.2300532-5-arnd@arndb.de>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Andi Kleen <ak@linux.intel.com>
Cc: Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, 2018-02-02 at 17:21 +0100, Arnd Bergmann wrote:
> I ran into a build error:
> 
> /git/arm-soc/net/sctp/sm_sideeffect.c: In function 'sctp_do_sm':
> /git/arm-soc/net/sctp/sm_sideeffect.c:1155:5: internal compiler error: Segmentation fault
>  int sctp_do_sm(struct net *net, enum sctp_event event_type,
>      ^
> 0xa42b7f crash_signal
> 
> The bug is fixed in mainline gcc now, but I carry this as I have
> not yet upgrade.
[]
> diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
[]
> @@ -1152,12 +1152,12 @@ static void sctp_cmd_send_asconf(struct sctp_association *asoc)
>   * If you want to understand all of lksctp, this is a
>   * good place to start.
>   */
> +typedef const char *(printfn_t)(union sctp_subtype);

This typedef is only used in this file twice.
Perhaps removing the typedef is clearer.

Given the debug_fn use is only in another
used-once macro, convert that debug_fn in
the macro too and avoid the unnecessary
variable initialization.

The debug_[pre|post]_[sfn|sfx] macros are
probably unnecessary indirections and could
be removed too but the code might read worse.

---
 net/sctp/sm_sideeffect.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index b71e7fb0a20a..5a6de0070b71 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -1133,8 +1133,9 @@ static void sctp_cmd_send_asconf(struct sctp_association *asoc)
  * functionality there.
  */
 #define debug_pre_sfn() \
-	pr_debug("%s[pre-fn]: ep:%p, %s, %s, asoc:%p[%s], %s\n", __func__, \
-		 ep, sctp_evttype_tbl[event_type], (*debug_fn)(subtype),   \
+	pr_debug("%s[pre-fn]: ep:%p, %s, %s, asoc:%p[%s], %s\n",	\
+		 __func__, ep, sctp_evttype_tbl[event_type],		\
+		 (*table[event_type])(subtype),				\
 		 asoc, sctp_state_tbl[state], state_fn->name)
 
 #define debug_post_sfn() \
@@ -1157,11 +1158,9 @@ int sctp_do_sm(struct net *net, enum sctp_event event_type,
 	       struct sctp_endpoint *ep, struct sctp_association *asoc,
 	       void *event_arg, gfp_t gfp)
 {
-	typedef const char *(printfn_t)(union sctp_subtype);
-	static printfn_t *table[] = {
+	static const char *(*table[])(union sctp_subtype) = {
 		NULL, sctp_cname, sctp_tname, sctp_oname, sctp_pname,
 	};
-	printfn_t *debug_fn  __attribute__ ((unused)) = table[event_type];
 	const struct sctp_sm_table_entry *state_fn;
 	struct sctp_cmd_seq commands;
 	enum sctp_disposition status;

