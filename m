Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e7.ny.us.ibm.com ([32.97.182.137]:47558 "EHLO e7.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752338Ab1KUW4c (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 17:56:32 -0500
Received: from /spool/local
	by e7.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <johnstul@us.ibm.com>;
	Mon, 21 Nov 2011 17:56:31 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id pALMtYSr198760
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 17:55:34 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id pALMtU42022221
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 20:55:31 -0200
Message-ID: <1321916127.6445.31.camel@work-vm>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: john stultz <johnstul@us.ibm.com>
Date: Mon, 21 Nov 2011 14:55:27 -0800
In-Reply-To: <1321915691.6445.29.camel@work-vm>
References: <1321567131.25715.32.camel@work-vm>
	 <1321685490-11706-1-git-send-email-lacombar@gmail.com>
	 <1321915691.6445.29.camel@work-vm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Mon, 2011-11-21 at 14:48 -0800, john stultz wrote:
> On Sat, 2011-11-19 at 01:51 -0500, Arnaud Lacombe wrote:
> > You'll find below some more nits
> > 
> > 1) bail out early on error.
> 
> Actually, I spoke a little too soon.
> 
> The set -e option causes us to bomb out if grep doesn't find a config
> option (grep returns 1 if nothing is found). So I'll have to drop that
> change for now.

Catching the error explicitly is easy enough, so folded in the following
fix (copied here from a terminal, so its whitespace damaged, I know) to
your patch:

@@ -20,8 +20,6 @@
 #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 #  See the GNU General Public License for more details.

-set -e
-
 clean_up() {
        rm -f $TMP_FILE
        exit
@@ -68,6 +66,9 @@ TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 for MERGE_FILE in $MERGE_LIST ; do
        echo "Merging $MERGE_FILE"
        CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
+       if [ $? != 0 ] ; then
+               exit 1
+       fi

        for CFG in $CFG_LIST ; do
                grep -q -w $CFG $TMP_FILE


thanks
-john

