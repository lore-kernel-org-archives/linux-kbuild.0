Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud6.xs4all.net ([194.109.24.28]:35275 "EHLO
	lb2-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752786AbbENLES (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 May 2015 07:04:18 -0400
Message-ID: <1431601446.2650.76.camel@x220>
Subject: Re: [PATCH 1/4] init/Kconfig: Fix break in middle of EXPERT menu
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 14 May 2015 13:04:06 +0200
In-Reply-To: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431531573.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431531573.git.josh@joshtriplett.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org

[Adding Michal and linux-kbuild.]

Hi Josh,

Could you please resend this series to include Michal and linux-kbuild?
Don't bother to include Yann. (I almost forwarded the entire series but
that looked impractical for patches.)

Please split 4/4 into two patches, while you're at it. Ie, 5/5 for
init/Kconfig.expert only, and 4/5 for the changes to scripts/kconfig/.

Thanks,


Paul Bolle

