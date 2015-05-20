Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud6.xs4all.net ([194.109.24.28]:43800 "EHLO
	lb2-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752039AbbETKAT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 06:00:19 -0400
Message-ID: <1432116013.21715.82.camel@x220>
Subject: Re: [PATCH 4/5] kconfig: Introduce "showif" to factor out
 conditions on visibility
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 20 May 2015 12:00:13 +0200
In-Reply-To: <760264ebf529ba3b0aa007144e2862bc73807dad.1431589089.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
	 <760264ebf529ba3b0aa007144e2862bc73807dad.1431589089.git.josh@joshtriplett.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Josh,

On Thu, 2015-05-14 at 08:36 -0700, Josh Triplett wrote:
> kconfig implicitly creates a submenu whenever a series of symbols all
> have dependencies or prompt-visibility expressions that all depend on a
> preceeding symbol.  For instance, the series of symbols following
> "menuconfig EXPERT" that all have "if EXPERT" on their prompt will all
> appear as a submenu of EXPERT.
> 
> However, this implicit submenuing will break if any intervening symbol
> loses its "if EXPERT"; doing so causes the subsequent symbols to appear
> in the parent menu ("General setup").  This has happened many times, and
> it's easy to miss that the entire block should have that same
> expression.
> 
> For submenus created from "depends" dependencies, these can be converted
> to a single wrapping "if expr ... endif" block around all the submenu
> items.  However, there's no equivalent for invisible items, for which
> the prompt is hidden but the symbol may potentially be enabled.  For
> instance, many items in the EXPERT menu are hidden if EXPERT is
> disabled, but they have "default y" or are determined by some other
> expression.

No one has reacted so far. So my plan to have the other people on
linux-kbuild do the work here is not going as I'd hoped. Bother...

I seem to remember that you had a list of three dozen menuconfig
instances that ran into the same issue as EXPERT's menuconfig. Do you
still have that list at hand?

Thanks,


Paul Bolle

