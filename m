Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:53787 "EHLO
	lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752894AbbE1SXq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 14:23:46 -0400
Message-ID: <1432837423.1354.29.camel@x220>
Subject: Re: [PATCH 4/5] kconfig: Introduce "showif" to factor out
 conditions on visibility
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 28 May 2015 20:23:43 +0200
In-Reply-To: <1432837051.1354.24.camel@x220>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
	 <760264ebf529ba3b0aa007144e2862bc73807dad.1431589089.git.josh@joshtriplett.org>
	 <1432837051.1354.24.camel@x220>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2015-05-28 at 20:17 +0200, Paul Bolle wrote:
> That being said, I'd like to bicycle-shed "showif". I'd rather reuse
> "visibility", which is obscure but already used, apparently for the same
> reason, and neatly matches the code this touches. I'll paste a (rough)
> diff that uses "visibility" (and "endvisibility") at the end of this
> message for people to play with, just to show what I mean. Please note
> that this draft patch is just what zconf.y confessed after I tortured it
> to say what I need.

s/visibility/visible/g

Thanks,


A brown paper bag

