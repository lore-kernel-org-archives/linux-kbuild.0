Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud2.xs4all.net ([194.109.24.29]:57581 "EHLO
	lb3-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753580AbbE1Jeq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 05:34:46 -0400
Message-ID: <1432805683.8508.45.camel@x220>
Subject: Re: [PATCH 3/5] kconfig: Regenerate parser with current Bison prior
 to making changes
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 28 May 2015 11:34:43 +0200
In-Reply-To: <60bb576cd3970c42acdf90336bcd708a8d785af4.1431589089.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
	 <60bb576cd3970c42acdf90336bcd708a8d785af4.1431589089.git.josh@joshtriplett.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2015-05-14 at 08:35 -0700, Josh Triplett wrote:
> Before making changes to the parser, regenerate the parser with current
> Bison to avoid mixing those changes with those produced by updating
> Bison.

You used bison 3.0.2, that's clear from the output. Did you use any
command line options? If so, please mention them. Even if not, it might
be good to even mention that.

(This is entirely self-serving. I hardly ever regenerate the _shipped
files so I keep forgetting the invocation of bison, and flex for that
matter.)

Thanks,


Paul Bolle

