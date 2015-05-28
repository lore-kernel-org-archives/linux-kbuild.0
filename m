Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:45424 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754159AbbE1O5u (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 10:57:50 -0400
Message-ID: <1432825060.8508.57.camel@x220>
Subject: Re: [PATCH 4/5] kconfig: Introduce "showif" to factor out
 conditions on visibility
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 28 May 2015 16:57:40 +0200
In-Reply-To: <20150520183042.GA5720@cloud>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
	 <760264ebf529ba3b0aa007144e2862bc73807dad.1431589089.git.josh@joshtriplett.org>
	 <1432116013.21715.82.camel@x220> <20150520183042.GA5720@cloud>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: josh@joshtriplett.org
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2015-05-20 at 11:30 -0700, josh@joshtriplett.org wrote:
> In net/rfkill/Kconfig, RFKILL_REGULATOR oddly has
> "depends on RFKILL || !RFKILL".  WIMAX does the same thing.

That's only tristate logic. It's a common idiom, but it looks very odd
compared to boolean logic. It ensures RFKILL_REGULATOR will not be 'y'
if RFKILL is 'm'. Because:
    RFKILL = 'n' => RFKILL_REGULATOR = 'n' || 'm' || 'y'
    RFKILL = 'm' => RFKILL_REGULATOR = 'n' || 'm'
    RFKILL = 'y' => RFKILL_REGULATOR = 'n' || 'm' || 'y'

Hope this helps,


Paul Bolle

