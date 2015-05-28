Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:34071 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753815AbbE1S2x (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 14:28:53 -0400
Message-ID: <1432837730.1354.33.camel@x220>
Subject: Re: [PATCH 4/5] kconfig: Introduce "showif" to factor out
 conditions on visibility
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 28 May 2015 20:28:50 +0200
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
> So, that's several cases that should use "if", at least one more that
> should use "showif" (PROCESSOR_SELECT), and several broken menus.

Would it be terribly rude to ask if you could send in a quick patch (of
the Not-signed-off-by variety) that uses both "if" and your "showif" (or
my "visible if" suggestion) to fix one or two of these problems?

Either way, I hope to give my final opinion some time next week.

Thanks,


Paul Bolle

