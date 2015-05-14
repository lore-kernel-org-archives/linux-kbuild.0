Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55096 "EHLO
	relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932578AbbENPhQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 May 2015 11:37:16 -0400
Date: Thu, 14 May 2015 08:37:05 -0700
From: josh@joshtriplett.org
Subject: Re: [PATCH 1/4] init/Kconfig: Fix break in middle of EXPERT menu
Message-ID: <20150514153705.GA27231@cloud>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431531573.git.josh@joshtriplett.org>
 <1431601446.2650.76.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431601446.2650.76.camel@x220>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org

On Thu, May 14, 2015 at 01:04:06PM +0200, Paul Bolle wrote:
> [Adding Michal and linux-kbuild.]
> 
> Hi Josh,
> 
> Could you please resend this series to include Michal and linux-kbuild?
> Don't bother to include Yann. (I almost forwarded the entire series but
> that looked impractical for patches.)

Done.

> Please split 4/4 into two patches, while you're at it. Ie, 5/5 for
> init/Kconfig.expert only, and 4/5 for the changes to scripts/kconfig/.

Done, though I managed to forget to mark it as v2, sorry.  That split
and Paul's ack are the only changes in v2.

- Josh Triplett
